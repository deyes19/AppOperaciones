require "application_system_test_case"

class RelocationsTest < ApplicationSystemTestCase
  setup do
    @relocation = relocations(:one)
  end

  test "visiting the index" do
    visit relocations_url
    assert_selector "h1", text: "Relocations"
  end

  test "should create relocation" do
    visit relocations_url
    click_on "New relocation"

    fill_in "", with: @relocation._
    fill_in "Date accept", with: @relocation.date_accept
    fill_in "Date solicited", with: @relocation.date_solicited
    click_on "Create Relocation"

    assert_text "Relocation was successfully created"
    click_on "Back"
  end

  test "should update Relocation" do
    visit relocation_url(@relocation)
    click_on "Edit this relocation", match: :first

    fill_in "", with: @relocation._
    fill_in "Date accept", with: @relocation.date_accept
    fill_in "Date solicited", with: @relocation.date_solicited
    click_on "Update Relocation"

    assert_text "Relocation was successfully updated"
    click_on "Back"
  end

  test "should destroy Relocation" do
    visit relocation_url(@relocation)
    click_on "Destroy this relocation", match: :first

    assert_text "Relocation was successfully destroyed"
  end
end
