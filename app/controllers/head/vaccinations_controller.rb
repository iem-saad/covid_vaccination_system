class Head::VaccinationsController < Head::HeadController
  def get_pin; end

  def vaccinate
    user_pin = ActiveRecord::Base.connection.exec_query("SELECT vac_pin from users where id = #{params[:user].to_i}").rows.first.first
    if user_pin == params[:pin]
      max_id = InjectedVacc.maximum(:id)
      max_id = 0 if max_id.nil?
      vacc = AssignedVacc.find_by_sql("SELECT * FROM ASSIGNED_VACCS WHERE user_id = #{params[:user].to_i}").first.vaccine_id
      sql = "INSERT INTO INJECTED_VACCS VALUES (#{max_id+1}, #{params[:user].to_i}, #{vacc})"
      ActiveRecord::Base.connection.exec_insert(sql)
      redirect_to head_dashboard_index_path(success: true) and return
    else
      redirect_to head_get_pin_path(user: params[:user].to_i, invalid: true) and return
    end
  end
end