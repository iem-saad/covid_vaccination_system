require "application_system_test_case"

class Admin::AllocatedVaccsTest < ApplicationSystemTestCase
  setup do
    @admin_allocated_vacc = admin_allocated_vaccs(:one)
  end

  test "visiting the index" do
    visit admin_allocated_vaccs_url
    assert_selector "h1", text: "Admin/Allocated Vaccs"
  end

  test "creating a Allocated vacc" do
    visit admin_allocated_vaccs_url
    click_on "New Admin/Allocated Vacc"

    fill_in "Amount", with: @admin_allocated_vacc.amount
    fill_in "Center", with: @admin_allocated_vacc.center_id
    fill_in "Vac", with: @admin_allocated_vacc.vac_id
    click_on "Create Allocated vacc"

    assert_text "Allocated vacc was successfully created"
    click_on "Back"
  end

  test "updating a Allocated vacc" do
    visit admin_allocated_vaccs_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @admin_allocated_vacc.amount
    fill_in "Center", with: @admin_allocated_vacc.center_id
    fill_in "Vac", with: @admin_allocated_vacc.vac_id
    click_on "Update Allocated vacc"

    assert_text "Allocated vacc was successfully updated"
    click_on "Back"
  end

  test "destroying a Allocated vacc" do
    visit admin_allocated_vaccs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Allocated vacc was successfully destroyed"
  end
end
