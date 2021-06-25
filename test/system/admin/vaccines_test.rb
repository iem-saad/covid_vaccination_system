require "application_system_test_case"

class Admin::VaccinesTest < ApplicationSystemTestCase
  setup do
    @admin_vaccine = admin_vaccines(:one)
  end

  test "visiting the index" do
    visit admin_vaccines_url
    assert_selector "h1", text: "Admin/Vaccines"
  end

  test "creating a Vaccine" do
    visit admin_vaccines_url
    click_on "New Admin/Vaccine"

    fill_in "Amount", with: @admin_vaccine.amount
    fill_in "Days to sec dose", with: @admin_vaccine.days_to_sec_dose
    fill_in "Name", with: @admin_vaccine.name
    fill_in "No of doses", with: @admin_vaccine.no_of_doses
    click_on "Create Vaccine"

    assert_text "Vaccine was successfully created"
    click_on "Back"
  end

  test "updating a Vaccine" do
    visit admin_vaccines_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @admin_vaccine.amount
    fill_in "Days to sec dose", with: @admin_vaccine.days_to_sec_dose
    fill_in "Name", with: @admin_vaccine.name
    fill_in "No of doses", with: @admin_vaccine.no_of_doses
    click_on "Update Vaccine"

    assert_text "Vaccine was successfully updated"
    click_on "Back"
  end

  test "destroying a Vaccine" do
    visit admin_vaccines_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vaccine was successfully destroyed"
  end
end
