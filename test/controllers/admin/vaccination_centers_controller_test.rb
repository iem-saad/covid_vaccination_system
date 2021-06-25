require "test_helper"

class Admin::VaccinationCentersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_vaccination_center = admin_vaccination_centers(:one)
  end

  test "should get index" do
    get admin_vaccination_centers_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_vaccination_center_url
    assert_response :success
  end

  test "should create admin_vaccination_center" do
    assert_difference('Admin::VaccinationCenter.count') do
      post admin_vaccination_centers_url, params: { admin_vaccination_center: { head_id: @admin_vaccination_center.head_id, location: @admin_vaccination_center.location, name: @admin_vaccination_center.name } }
    end

    assert_redirected_to admin_vaccination_center_url(Admin::VaccinationCenter.last)
  end

  test "should show admin_vaccination_center" do
    get admin_vaccination_center_url(@admin_vaccination_center)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_vaccination_center_url(@admin_vaccination_center)
    assert_response :success
  end

  test "should update admin_vaccination_center" do
    patch admin_vaccination_center_url(@admin_vaccination_center), params: { admin_vaccination_center: { head_id: @admin_vaccination_center.head_id, location: @admin_vaccination_center.location, name: @admin_vaccination_center.name } }
    assert_redirected_to admin_vaccination_center_url(@admin_vaccination_center)
  end

  test "should destroy admin_vaccination_center" do
    assert_difference('Admin::VaccinationCenter.count', -1) do
      delete admin_vaccination_center_url(@admin_vaccination_center)
    end

    assert_redirected_to admin_vaccination_centers_url
  end
end
