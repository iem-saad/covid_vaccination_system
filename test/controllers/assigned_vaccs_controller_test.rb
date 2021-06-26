require "test_helper"

class AssignedVaccsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assigned_vacc = assigned_vaccs(:one)
  end

  test "should get index" do
    get assigned_vaccs_url
    assert_response :success
  end

  test "should get new" do
    get new_assigned_vacc_url
    assert_response :success
  end

  test "should create assigned_vacc" do
    assert_difference('AssignedVacc.count') do
      post assigned_vaccs_url, params: { assigned_vacc: { user_id: @assigned_vacc.user_id, vaccine_center_id: @assigned_vacc.vaccine_center_id, vaccine_id: @assigned_vacc.vaccine_id } }
    end

    assert_redirected_to assigned_vacc_url(AssignedVacc.last)
  end

  test "should show assigned_vacc" do
    get assigned_vacc_url(@assigned_vacc)
    assert_response :success
  end

  test "should get edit" do
    get edit_assigned_vacc_url(@assigned_vacc)
    assert_response :success
  end

  test "should update assigned_vacc" do
    patch assigned_vacc_url(@assigned_vacc), params: { assigned_vacc: { user_id: @assigned_vacc.user_id, vaccine_center_id: @assigned_vacc.vaccine_center_id, vaccine_id: @assigned_vacc.vaccine_id } }
    assert_redirected_to assigned_vacc_url(@assigned_vacc)
  end

  test "should destroy assigned_vacc" do
    assert_difference('AssignedVacc.count', -1) do
      delete assigned_vacc_url(@assigned_vacc)
    end

    assert_redirected_to assigned_vaccs_url
  end
end
