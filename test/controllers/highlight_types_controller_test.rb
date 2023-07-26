require "test_helper"

class HighlightTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer = customers(:one)
    @highlight_type = @customer.highlight_types.last
  end

  test "should get new" do
    get new_customer_highlight_type_url(@customer)
    assert_response :success
  end

  test "should create highlight_type" do
    assert_difference("HighlightType.count") do
      post customer_highlight_types_url(@customer), params: {highlight_type: {color: @highlight_type.color, name: "A new name"}}
    end

    assert_redirected_to edit_customer_url(@customer)
  end

  test "should get edit" do
    get edit_customer_highlight_type_url(@customer, @highlight_type)
    assert_response :success
  end

  test "should update highlight_type" do
    patch customer_highlight_type_url(@customer, @highlight_type), params: {highlight_type: {color: @highlight_type.color, name: @highlight_type.name, position: @highlight_type.position}}
    assert_redirected_to edit_customer_url(@customer)
  end

  test "should destroy highlight_type" do
    assert_difference("HighlightType.count", -1) do
      delete customer_highlight_type_url(@customer, @highlight_type)
    end

    assert_redirected_to edit_customer_url(@customer)
  end

  test "index via json" do
    get customer_highlight_types_path(@customer), as: :json
    assert_response :success
    assert valid_json?(body)
    types = JSON.parse(body)
    assert_equal types.count, 2
    first_highlight_type = @customer.highlight_types.first
    first_highlight_type_attrs = types[0].with_indifferent_access
    assert_equal first_highlight_type_attrs[:id], first_highlight_type.id
    assert_equal first_highlight_type_attrs[:name], first_highlight_type.name
    assert_equal first_highlight_type_attrs[:color], first_highlight_type.color
    assert_equal first_highlight_type_attrs[:position], first_highlight_type.position
  end

  test "show via json" do
    get customer_highlight_type_path(@customer, @highlight_type), as: :json
    assert_response :success
    assert valid_json?(body)
    first_highlight_type_attrs = JSON.parse(body).with_indifferent_access
    assert_equal first_highlight_type_attrs[:id], @highlight_type.id
    assert_equal first_highlight_type_attrs[:name], @highlight_type.name
    assert_equal first_highlight_type_attrs[:color], @highlight_type.color
    assert_equal first_highlight_type_attrs[:position], @highlight_type.position
  end

  test "create via json" do
    post customer_highlight_types_path(@customer), params: {
      name: "A new one",
      color: "#red"
    }, as: :json
    assert_response :success
    assert valid_json?(body)
    first_highlight_type_attrs = JSON.parse(body).with_indifferent_access
    assert first_highlight_type_attrs[:id].present?
    assert_equal first_highlight_type_attrs[:name], "A new one"
    assert_equal first_highlight_type_attrs[:color], "#red"
    assert_equal first_highlight_type_attrs[:position], 0
  end

  test "update name and color via json" do
    patch customer_highlight_type_path(@customer, @highlight_type), params: {
      name: "Insight2",
      color: "#orange"
    }, as: :json
    assert_response :success
    assert valid_json?(body)
    first_highlight_type_attrs = JSON.parse(body).with_indifferent_access
    assert first_highlight_type_attrs[:id].present?
    assert_equal first_highlight_type_attrs[:id], @highlight_type.id
    assert_equal first_highlight_type_attrs[:name], "Insight2"
    assert_equal first_highlight_type_attrs[:color], "#orange"
    assert_equal first_highlight_type_attrs[:position], @highlight_type.position
  end

  test "move via json" do
    patch move_customer_highlight_type_path(@customer, @highlight_type), params: {
      highlight_type: {
        position: 0,
        highlight_types_fingerprint: @customer.highlight_types_fingerprint
      }
    }, as: :json
    assert_response :success
    assert valid_json?(body)
    first_highlight_type_attrs = JSON.parse(body).with_indifferent_access
    assert first_highlight_type_attrs[:id].present?
    assert_equal first_highlight_type_attrs[:id], @highlight_type.id
    assert_equal first_highlight_type_attrs[:name], @highlight_type.name
    assert_equal first_highlight_type_attrs[:color], @highlight_type.color
    assert_equal first_highlight_type_attrs[:position], 0
  end

  test "delete via json" do
    delete customer_highlight_type_path(@customer, @highlight_type), as: :json
    assert_response :success
    assert_equal body, ""
  end

  private

  def valid_json?(value)
    result = JSON.parse(value)
    result.is_a?(Hash) || result.is_a?(Array)
  rescue JSON::ParserError, TypeError
    false
  end
end
