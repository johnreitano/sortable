require "test_helper"

class CustomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer = customers(:one)
  end

  test "should get index" do
    get customers_url
    assert_response :success
  end

  test "should get new" do
    get new_customer_url
    assert_response :success
  end

  test "should create customer" do
    assert_difference("Customer.count") do
      post customers_url, params: { customer: { name: @customer.name } }
    end

    assert_redirected_to edit_customer_path(Customer.last)
  end

  test "should get edit" do
    get edit_customer_path(@customer)
    assert_response :success
  end

  test "should update customer" do
    patch customer_url(@customer), params: { customer: { name: @customer.name } }
    assert_redirected_to edit_customer_path(@customer)
  end

  test "should destroy customer" do
    assert_difference("Customer.count", -1) do
      delete customer_url(@customer)
    end

    assert_redirected_to customers_url
  end
end
