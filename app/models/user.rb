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
end
