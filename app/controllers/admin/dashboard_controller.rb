class Admin::DashboardController < Admin::AdminController
  def index
    @applied_vac = ActiveRecord::Base.connection.exec_query("SELECT count(user_id) FROM ASSIGNED_VACCS").rows.first.first
    @non_applied_vac = ActiveRecord::Base.connection.exec_query("SELECT count(id) FROM USERS").rows.first.first
    @non_applied_vac = @non_applied_vac - @applied_vac
  end
end
