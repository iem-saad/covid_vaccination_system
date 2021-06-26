require "application_system_test_case"

class AssignedVaccsTest < ApplicationSystemTestCase
  setup do
    @assigned_vacc = assigned_vaccs(:one)
  end

  test "visiting the index" do
    visit assigned_vaccs_url
    assert_selector "h1", text: "Assigned Vaccs"
  end

  test "creating a Assigned vacc" do
    visit assigned_vaccs_url
    click_on "New Assigned Vacc"

    fill_in "User", with: @assigned_vacc.user_id
    fill_in "Vaccine center", with: @assigned_vacc.vaccine_center_id
    fill_in "Vaccine", with: @assigned_vacc.vaccine_id
    click_on "Create Assigned vacc"

    assert_text "Assigned vacc was successfully created"
    click_on "Back"
  end

  test "updating a Assigned vacc" do
    visit assigned_vaccs_url
    click_on "Edit", match: :first

    fill_in "User", with: @assigned_vacc.user_id
    fill_in "Vaccine center", with: @assigned_vacc.vaccine_center_id
    fill_in "Vaccine", with: @assigned_vacc.vaccine_id
    click_on "Update Assigned vacc"

    assert_text "Assigned vacc was successfully updated"
    click_on "Back"
  end

  test "destroying a Assigned vacc" do
    visit assigned_vaccs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Assigned vacc was successfully destroyed"
  end
end
