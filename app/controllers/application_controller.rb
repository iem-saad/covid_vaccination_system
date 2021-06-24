class ApplicationController < ActionController::Base

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
