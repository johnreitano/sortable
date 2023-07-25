require "test_helper"

class HighlightTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer = customers(:one)
    @highlight_type = @customer.highlight_types.first
  end

  test "should get new" do
    get new_customer_highlight_type_url(@customer)
    assert_response :success
  end

  test "should create highlight_type" do
    assert_difference("HighlightType.count") do
      post customer_highlight_types_url(@customer), params: { highlight_type: { color: @highlight_type.color, name: "A new name" } }
    end

    assert_redirected_to edit_customer_url(@customer)
  end

  test "should get edit" do
    get edit_customer_highlight_type_url(@customer, @highlight_type)
    assert_response :success
  end

  test "should update highlight_type" do
    patch customer_highlight_type_url(@customer, @highlight_type), params: { highlight_type: { color: @highlight_type.color, name: @highlight_type.name, position: @highlight_type.position } }
    assert_redirected_to edit_customer_url(@customer)
  end

  test "should destroy highlight_type" do
    assert_difference("HighlightType.count", -1) do
      delete customer_highlight_type_url(@customer, @highlight_type)
    end

    assert_redirected_to edit_customer_url(@customer)
  end
end
