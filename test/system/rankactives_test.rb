require "application_system_test_case"

class RankactivesTest < ApplicationSystemTestCase
  setup do
    @rankactive = rankactives(:one)
  end

  test "visiting the index" do
    visit rankactives_url
    assert_selector "h1", text: "Rankactives"
  end

  test "should create rankactive" do
    visit rankactives_url
    click_on "New rankactive"

    fill_in "Name", with: @rankactive.name
    click_on "Create Rankactive"

    assert_text "Rankactive was successfully created"
    click_on "Back"
  end

  test "should update Rankactive" do
    visit rankactive_url(@rankactive)
    click_on "Edit this rankactive", match: :first

    fill_in "Name", with: @rankactive.name
    click_on "Update Rankactive"

    assert_text "Rankactive was successfully updated"
    click_on "Back"
  end

  test "should destroy Rankactive" do
    visit rankactive_url(@rankactive)
    click_on "Destroy this rankactive", match: :first

    assert_text "Rankactive was successfully destroyed"
  end
end
