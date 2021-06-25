class Admin::VaccinationCenter < ApplicationRecord
	def self.all_centers
    	Admin::VaccinationCenter.find_by_sql("SELECT * FROM ADMIN_VACCINATION_CENTERS")
  	end
end
