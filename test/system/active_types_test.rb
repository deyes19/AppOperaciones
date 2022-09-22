require "application_system_test_case"

class ActiveTypesTest < ApplicationSystemTestCase
  setup do
    @active_type = active_types(:one)
  end

  test "visiting the index" do
    visit active_types_url
    assert_selector "h1", text: "Active types"
  end

  test "should create active type" do
    visit active_types_url
    click_on "New active type"

    fill_in "Description", with: @active_type.description
    click_on "Create Active type"

    assert_text "Active type was successfully created"
    click_on "Back"
  end

  test "should update Active type" do
    visit active_type_url(@active_type)
    click_on "Edit this active type", match: :first

    fill_in "Description", with: @active_type.description
    click_on "Update Active type"

    assert_text "Active type was successfully updated"
    click_on "Back"
  end

  test "should destroy Active type" do
    visit active_type_url(@active_type)
    click_on "Destroy this active type", match: :first

    assert_text "Active type was successfully destroyed"
  end
end
