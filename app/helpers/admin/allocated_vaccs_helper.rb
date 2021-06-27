module Admin::AllocatedVaccsHelper

  def vacc_name(id)
    Admin::Vaccine.find_by_sql("SELECT * FROM ADMIN_VACCINES WHERE id = #{id}").first.name
  end

  def vac_dose_count(id)
    Admin::Vaccine.find_by_sql("SELECT * FROM ADMIN_VACCINES WHERE id = #{id}").first.no_of_doses
  end

  def center_name(id)
    Admin::VaccinationCenter.find_by_sql("SELECT * FROM ADMIN_VACCINATION_CENTERS WHERE id = #{id}").first.name
  end

  def center_location(id)
    Admin::VaccinationCenter.find_by_sql("SELECT * FROM ADMIN_VACCINATION_CENTERS WHERE id = #{id}").first.location
  end

  def user_name(id)
    User.find_by_sql("SELECT * FROM USERS WHERE id = #{id}").first.first_name
  end

  def get_user(id)
    User.find_by_sql("SELECT * FROM  USERS WHERE ID = #{id}").first
  end
end
