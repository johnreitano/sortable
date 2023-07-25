require "application_system_test_case"

class CustomersTest < ApplicationSystemTestCase
  setup do
    @customer = customers(:one)
  end

  test "visiting the index" do
    visit customers_url
    assert_selector "h4", text: "Customers"
  end

  test "should create customer" do
    visit customers_url
    click_on "Add New Customer"

    fill_in "customer[name]", with: @customer.name
    click_on "Create Customer"

    assert_text "Customer was successfully created."
  end

  test "should update Customer" do
    visit edit_customer_path(@customer)

    fill_in "customer[name]", with: @customer.name
    click_on "Update Customer Name"

    assert_text "Customer was successfully updated."
  end

  test "should destroy Customer" do
    visit edit_customer_path(@customer)
    take_screenshot
    click_on "Delete Customer"
    assert_text "Customer was successfully deleted."
  end
end
