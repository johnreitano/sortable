require "application_system_test_case"

class HighlightTypesTest < ApplicationSystemTestCase
  setup do
    @customer = customers(:one)
    @highlight_type = @customer.highlight_types.first
  end

  test "viewing the index" do
    visit edit_customer_path(@customer)
    assert_selector "h4", text: "Highlight Types"
  end

  test "should create highlight type" do
    visit edit_customer_path(@customer)
    click_on "Add New Highlight Type"

    fill_in "highlight_type[name]", with: "another name"
    fill_in "highlight_type[color]", with: @highlight_type.color
    click_on "Create Highlight Type"

    assert_text "Highlight type was successfully created."
  end

  test "should update highlight type" do
    visit edit_customer_path(@customer)
    click_on @highlight_type.name
    fill_in "highlight_type[name]", with: @highlight_type.name
    fill_in "highlight_type[color]", with: @highlight_type.color
    click_on "Update Highlight Type"
    assert_text "Highlight type was successfully updated."
  end

  test "should destroy Highlight Type" do
    visit edit_customer_path(@customer)
    click_on @highlight_type.name
    click_on "Delete Highlight Type", match: :first
    assert_text "Highlight type was successfully deleted."
  end
end
 