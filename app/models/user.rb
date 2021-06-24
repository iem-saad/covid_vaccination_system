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
end
