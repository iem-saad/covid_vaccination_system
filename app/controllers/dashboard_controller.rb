class DashboardController < ApplicationController
  def index
    if current_user.vaccinated? || current_user.partial_vaccinated?
      @vac_id = ActiveRecord::Base.connection.exec_query("SELECT V.VACCINE_ID FROM USERS U INNER JOIN ASSIGNED_VACCS V ON U.ID = V.user_id WHERE U.ID = #{current_user.id}").rows.first.first
      @center_id = ActiveRecord::Base.connection.exec_query("SELECT V.VACCINE_CENTER_ID FROM USERS U INNER JOIN ASSIGNED_VACCS V ON U.ID = V.user_id WHERE U.ID = #{current_user.id}").rows.first.first
    end
  end
  def show_user
    @user = User.find_by_sql("SELECT * FROM USERS WHERE ID = #{params[:user].to_i}").first
  end
end
