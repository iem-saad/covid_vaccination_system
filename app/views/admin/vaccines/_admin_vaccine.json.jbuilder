json.extract! admin_vaccine, :id, :name, :no_of_doses, :days_to_sec_dose, :amount, :created_at, :updated_at
json.url admin_vaccine_url(admin_vaccine, format: :json)
