class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def admin?
    sql = "Select * from ASSIGNED_ROLES where user_id = #{self.id} AND role_id = 1"
    admin = ActiveRecord::Base.connection.exec_query(sql)
    admin.rows.first.present?
  end

  def head?
    sql = "Select * from ASSIGNED_ROLES where user_id = #{self.id} AND role_id = 2"
    head = ActiveRecord::Base.connection.exec_query(sql)
    head.rows.first.present?
  end

  def staff?
    sql = "Select * from ASSIGNED_ROLES where user_id = #{self.id} AND role_id = 3"
    staff = ActiveRecord::Base.connection.exec_query(sql)
    staff.rows.first.present?
  end

  def vac_person?
    sql = "Select * from ASSIGNED_ROLES where user_id = #{self.id} AND role_id = 4"
    person = ActiveRecord::Base.connection.exec_query(sql)
    person.rows.first.present?
  end

  def self.all_heads_array(id)
    name =  User.find_by_sql("SELECT * FROM USERS WHERE id = #{id}").first.first_name
    sql = "SELECT id, first_name FROM USERS WHERE ID IN (Select user_id from ASSIGNED_ROLES where role_id = 2 AND user_id NOT IN (SELECT head_id FROM ADMIN_VACCINATION_CENTERS))"
    heads = ActiveRecord::Base.connection.exec_query(sql)
    result = heads.rows
    result.push([id,name])
  end

  def self.all_heads
    result = User.find_by_sql("SELECT * FROM USERS WHERE ID IN (Select user_id from ASSIGNED_ROLES where role_id = 2 AND user_id NOT IN (SELECT head_id FROM ADMIN_VACCINATION_CENTERS))")
  end

  def applied_for_vacc?
    sql = "Select * from ASSIGNED_VACCS where user_id = #{self.id}"
    person = ActiveRecord::Base.connection.exec_query(sql)
    person.rows.first.present?
  end

  def vaccinated?
    sql = "SELECT count(user_id) from INJECTED_VACCS WHERE user_id = #{self.id}"
    count = ActiveRecord::Base.connection.exec_query(sql).rows.first.first
    return false if count == 0
    vacc = AssignedVacc.find_by_sql("SELECT * FROM ASSIGNED_VACCS WHERE user_id = #{self.id}").first.vaccine_id
    required_doses = Admin::Vaccine.find_by_sql("SELECT * FROM ADMIN_VACCINES WHERE ID = #{vacc}").first.no_of_doses
    required_doses == count
  end

  def partial_vaccinated?
    return true if self.vac_stage == 1
    return false
  end

  def update_vac_stage
    sql = "SELECT count(user_id) from INJECTED_VACCS WHERE user_id = #{self.id}"
    count = ActiveRecord::Base.connection.exec_query(sql).rows.first.first
    return false if count == 0
    vacc = AssignedVacc.find_by_sql("SELECT * FROM ASSIGNED_VACCS WHERE user_id = #{self.id}").first.vaccine_id
    required_doses = Admin::Vaccine.find_by_sql("SELECT * FROM ADMIN_VACCINES WHERE ID = #{vacc}").first.no_of_doses
    if required_doses == count
      ActiveRecord::Base.connection.execute("Update USERS SET VAC_STAGE = 2 where id = #{self.id}")
    else
      ActiveRecord::Base.connection.execute("Update USERS SET VAC_STAGE = 1 where id = #{self.id}")
    end
  end

  def get_vac_stage
    return self.vac_stage
  end

  def self.vaccinated_users
    User.find_by_sql("SELECT * FROM USERS WHERE VAC_STAGE = 2")
  end

  def non_vaccinated_users
    User.find_by_sql("SELECT * FROM USERS WHERE ID NOT IN (SELECT ID FROM USERS WHERE VAC_STAGE = 2)")
  end

  def vacc_details
    AssignedVacc.find_by_sql("SELECT * FROM ASSIGNED_VACCS WHERE USER_ID = #{self.id}").first
  end
end
