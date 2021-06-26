class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to main_app.root_url, alert: exception.message }
    end
  end
  before_action :authenticate_user!

	def after_sign_in_path_for(*)
    if current_user&.admin?
      admin_dashboard_index_path
    elsif current_user&.present?
      dashboard_index_path
    else
      root_path
    end
  end

end
