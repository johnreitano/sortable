require "application_system_test_case"

class HighlightsTest < ApplicationSystemTestCase
  setup do
    @customer = customers(:one)
    @highlight = @customer.highlights.first
  end

  test "viewing the index" do
    visit edit_customer_url(@customer)
    assert_selector "h4", text: "Highlights"
  end

  test "should create highlight" do
    visit edit_customer_url(@customer)
    click_on "Add New Highlight"

    fill_in "Color", with: @highlight.color
    fill_in "Name", with: @highlight.name
    click_on "Create Highlight"

    assert_text "Highlight was successfully created"
    click_on "Back to customer"
  end

  test "should update Highlight" do
    visit edit_customer_url(@customer)
    click_on "Edit", match: :first

    fill_in "Name", with: @highlight.name
    fill_in "Color", with: @highlight.color
    click_on "Update Highlight"

    assert_text "Highlight was successfully updated"
    click_on "Back"
  end

  test "should destroy Highlight" do
    visit edit_customer_url(@customer)
    click_on "Edit", match: :first
    click_on "Destroy this highlight", match: :first
    assert_text "Highlight was successfully destroyed"
  end
end
