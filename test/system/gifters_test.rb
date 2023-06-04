require "application_system_test_case"

class GiftersTest < ApplicationSystemTestCase
  setup do
    @gifter = gifters(:one)
  end

  test "visiting the index" do
    visit gifters_url
    assert_selector "h1", text: "Gifters"
  end

  test "should create gifter" do
    visit gifters_url
    click_on "New gifter"

    fill_in "Ammount", with: @gifter.ammount
    fill_in "Email", with: @gifter.email
    fill_in "Gift", with: @gifter.gift_id
    fill_in "Message", with: @gifter.message
    fill_in "Name", with: @gifter.name
    click_on "Create Gifter"

    assert_text "Gifter was successfully created"
    click_on "Back"
  end

  test "should update Gifter" do
    visit gifter_url(@gifter)
    click_on "Edit this gifter", match: :first

    fill_in "Ammount", with: @gifter.ammount
    fill_in "Email", with: @gifter.email
    fill_in "Gift", with: @gifter.gift_id
    fill_in "Message", with: @gifter.message
    fill_in "Name", with: @gifter.name
    click_on "Update Gifter"

    assert_text "Gifter was successfully updated"
    click_on "Back"
  end

  test "should destroy Gifter" do
    visit gifter_url(@gifter)
    click_on "Destroy this gifter", match: :first

    assert_text "Gifter was successfully destroyed"
  end
end
