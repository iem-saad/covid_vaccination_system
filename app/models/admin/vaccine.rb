class Admin::Vaccine < ApplicationRecord
	def self.all_vaccines
    	Admin::Vaccine.find_by_sql("SELECT * FROM ADMIN_VACCINES")
  	end
end
