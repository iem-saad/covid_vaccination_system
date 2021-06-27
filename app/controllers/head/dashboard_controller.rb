class Head::DashboardController < Head::HeadController
  def index
    if current_user.head?
    @center_data = Admin::VaccinationCenter.find_by_sql("SELECT * FROM ADMIN_VACCINATION_CENTERS WHERE head_id = #{current_user.id}").first
    @center_persons = AssignedVacc.find_by_sql("SELECT * FROM ASSIGNED_VACCS WHERE vaccine_center_id = #{@center_data.id}") if @center_data.present?
    else
      redirect_to root_path, flash: { error: "Insufficient Previliges" } and return
    end
  end
end