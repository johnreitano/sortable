require "test_helper"

class HighlightsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer = customers(:one)
    @highlight = @customer.highlights.first
  end

  test "should get new" do
    get new_customer_highlight_url(@customer)
    assert_response :success
  end

  test "should create highlight" do
    assert_difference("Highlight.count") do
      post customer_highlights_url(@customer), params: { highlight: { color: @highlight.color, name: @highlight.name } }
    end

    assert_redirected_to edit_customer_url(@customer)
  end

  test "should get edit" do
    get edit_customer_highlight_url(@customer, @highlight)
    assert_response :success
  end

  test "should update highlight" do
    patch customer_highlight_url(@customer, @highlight), params: { highlight: { color: @highlight.color, name: @highlight.name, position: @highlight.position } }
    assert_redirected_to edit_customer_url(@customer)
  end

  test "should destroy highlight" do
    assert_difference("Highlight.count", -1) do
      delete customer_highlight_url(@customer, @highlight)
    end

    assert_redirected_to edit_customer_url(@customer)
  end
end
