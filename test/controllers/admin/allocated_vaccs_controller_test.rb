require "test_helper"

class Admin::AllocatedVaccsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_allocated_vacc = admin_allocated_vaccs(:one)
  end

  test "should get index" do
    get admin_allocated_vaccs_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_allocated_vacc_url
    assert_response :success
  end

  test "should create admin_allocated_vacc" do
    assert_difference('Admin::AllocatedVacc.count') do
      post admin_allocated_vaccs_url, params: { admin_allocated_vacc: { amount: @admin_allocated_vacc.amount, center_id: @admin_allocated_vacc.center_id, vac_id: @admin_allocated_vacc.vac_id } }
    end

    assert_redirected_to admin_allocated_vacc_url(Admin::AllocatedVacc.last)
  end

  test "should show admin_allocated_vacc" do
    get admin_allocated_vacc_url(@admin_allocated_vacc)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_allocated_vacc_url(@admin_allocated_vacc)
    assert_response :success
  end

  test "should update admin_allocated_vacc" do
    patch admin_allocated_vacc_url(@admin_allocated_vacc), params: { admin_allocated_vacc: { amount: @admin_allocated_vacc.amount, center_id: @admin_allocated_vacc.center_id, vac_id: @admin_allocated_vacc.vac_id } }
    assert_redirected_to admin_allocated_vacc_url(@admin_allocated_vacc)
  end

  test "should destroy admin_allocated_vacc" do
    assert_difference('Admin::AllocatedVacc.count', -1) do
      delete admin_allocated_vacc_url(@admin_allocated_vacc)
    end

    assert_redirected_to admin_allocated_vaccs_url
  end
end
