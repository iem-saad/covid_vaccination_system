require "application_system_test_case"

class Admin::VaccinationCentersTest < ApplicationSystemTestCase
  setup do
    @admin_vaccination_center = admin_vaccination_centers(:one)
  end

  test "visiting the index" do
    visit admin_vaccination_centers_url
    assert_selector "h1", text: "Admin/Vaccination Centers"
  end

  test "creating a Vaccination center" do
    visit admin_vaccination_centers_url
    click_on "New Admin/Vaccination Center"

    fill_in "Head", with: @admin_vaccination_center.head_id
    fill_in "Location", with: @admin_vaccination_center.location
    fill_in "Name", with: @admin_vaccination_center.name
    click_on "Create Vaccination center"

    assert_text "Vaccination center was successfully created"
    click_on "Back"
  end

  test "updating a Vaccination center" do
    visit admin_vaccination_centers_url
    click_on "Edit", match: :first

    fill_in "Head", with: @admin_vaccination_center.head_id
    fill_in "Location", with: @admin_vaccination_center.location
    fill_in "Name", with: @admin_vaccination_center.name
    click_on "Update Vaccination center"

    assert_text "Vaccination center was successfully updated"
    click_on "Back"
  end

  test "destroying a Vaccination center" do
    visit admin_vaccination_centers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vaccination center was successfully destroyed"
  end
end
