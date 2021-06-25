module Admin::AllocatedVaccsHelper
	def vacc_name(id)
    	Admin::Vaccine.find_by_sql("SELECT * FROM ADMIN_VACCINES WHERE id = #{id}").first.name
	end

	def center_name(id)
    	Admin::VaccinationCenter.find_by_sql("SELECT * FROM ADMIN_VACCINATION_CENTERS WHERE id = #{id}").first.name
	end
end
