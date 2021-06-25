require "test_helper"

class Admin::VaccinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_vaccine = admin_vaccines(:one)
  end

  test "should get index" do
    get admin_vaccines_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_vaccine_url
    assert_response :success
  end

  test "should create admin_vaccine" do
    assert_difference('Admin::Vaccine.count') do
      post admin_vaccines_url, params: { admin_vaccine: { amount: @admin_vaccine.amount, days_to_sec_dose: @admin_vaccine.days_to_sec_dose, name: @admin_vaccine.name, no_of_doses: @admin_vaccine.no_of_doses } }
    end

    assert_redirected_to admin_vaccine_url(Admin::Vaccine.last)
  end

  test "should show admin_vaccine" do
    get admin_vaccine_url(@admin_vaccine)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_vaccine_url(@admin_vaccine)
    assert_response :success
  end

  test "should update admin_vaccine" do
    patch admin_vaccine_url(@admin_vaccine), params: { admin_vaccine: { amount: @admin_vaccine.amount, days_to_sec_dose: @admin_vaccine.days_to_sec_dose, name: @admin_vaccine.name, no_of_doses: @admin_vaccine.no_of_doses } }
    assert_redirected_to admin_vaccine_url(@admin_vaccine)
  end

  test "should destroy admin_vaccine" do
    assert_difference('Admin::Vaccine.count', -1) do
      delete admin_vaccine_url(@admin_vaccine)
    end

    assert_redirected_to admin_vaccines_url
  end
end
