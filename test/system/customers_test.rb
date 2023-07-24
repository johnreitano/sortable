require "application_system_test_case"

class CustomersTest < ApplicationSystemTestCase
  setup do
    @customer = customers(:one)
  end

  test "visiting the index" do
    visit customers_url
    assert_selector "h1", text: "Customers"
  end

  test "should create customer" do
    visit customers_url
    click_on "Create New Customer"

    fill_in "Name", with: @customer.name
    click_on "Create Customer"

    assert_text "Customer was successfully created"
    click_on "Back"
  end

  test "should update Customer" do
    visit edit_customer_url(@customer)

    fill_in "Name", with: @customer.name
    click_on "Update Customer Name"

    assert_text "Customer was successfully updated"
    click_on "Back"
  end

  test "should destroy Customer" do
    visit edit_customer_url(@customer)
    take_screenshot
    click_on "Destroy this customer"
    assert_text "Customer was successfully destroyed"
  end
end
