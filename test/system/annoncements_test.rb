require "application_system_test_case"

class AnnoncementsTest < ApplicationSystemTestCase
  setup do
    @annoncement = annoncements(:one)
  end

  test "visiting the index" do
    visit annoncements_url
    assert_selector "h1", text: "Annoncements"
  end

  test "should create annoncement" do
    visit annoncements_url
    click_on "New annoncement"

    fill_in "Category", with: @annoncement.category_id
    fill_in "Description", with: @annoncement.description
    fill_in "Location", with: @annoncement.location
    fill_in "Price", with: @annoncement.price
    fill_in "Title", with: @annoncement.title
    fill_in "Type", with: @annoncement.type
    fill_in "User", with: @annoncement.user_id
    click_on "Create Annoncement"

    assert_text "Annoncement was successfully created"
    click_on "Back"
  end

  test "should update Annoncement" do
    visit annoncement_url(@annoncement)
    click_on "Edit this annoncement", match: :first

    fill_in "Category", with: @annoncement.category_id
    fill_in "Description", with: @annoncement.description
    fill_in "Location", with: @annoncement.location
    fill_in "Price", with: @annoncement.price
    fill_in "Title", with: @annoncement.title
    fill_in "Type", with: @annoncement.type
    fill_in "User", with: @annoncement.user_id
    click_on "Update Annoncement"

    assert_text "Annoncement was successfully updated"
    click_on "Back"
  end

  test "should destroy Annoncement" do
    visit annoncement_url(@annoncement)
    click_on "Destroy this annoncement", match: :first

    assert_text "Annoncement was successfully destroyed"
  end
end
