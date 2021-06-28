class Head::VaccinationsController < Head::HeadController
  def get_pin; end

  def vaccinate
    user_pin = ActiveRecord::Base.connection.exec_query("SELECT vac_pin from users where id = #{params[:user].to_i}").rows.first.first
    if user_pin == params[:pin]
      max_id = InjectedVacc.maximum(:id)
      max_id = 0 if max_id.nil?
      record = AssignedVacc.find_by_sql("SELECT * FROM ASSIGNED_VACCS WHERE user_id = #{params[:user].to_i}").first
      vacc = record.vaccine_id
      vacc_center = record.vaccine_center_id
      amt = Admin::AllocatedVacc.find_by_sql("SELECT * FROM ADMIN_ALLOCATED_VACCS WHERE vac_id = #{vacc} AND center_id = #{vacc_center}").first.amount
      if amt == 0
        flash[:error] = "Ops! Not Enough Vaccines Available"
        redirect_to head_get_pin_path(user: params[:user].to_i) and return
      end
      amt = amt - 1
      ActiveRecord::Base.connection.execute("UPDATE ADMIN_ALLOCATED_VACCS SET amount = #{amt} Where vac_id = #{vacc} AND center_id = #{vacc_center}")
      sql = "INSERT INTO INJECTED_VACCS VALUES (#{max_id+1}, #{params[:user].to_i}, #{vacc})"
      ActiveRecord::Base.connection.exec_insert(sql)
      User.find_by_sql("SELECT * FROM USERS WHERE ID = #{params[:user].to_i}").first.update_vac_stage
      redirect_to head_dashboard_index_path(success: true) and return
    else
      redirect_to head_get_pin_path(user: params[:user].to_i, invalid: true) and return
    end
  end
end