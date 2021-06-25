class CreateAdminVaccinationCenters < ActiveRecord::Migration[6.1]
  def change
    create_table :admin_vaccination_centers do |t|
      t.string :name, null: false
      t.text :location, null: false
      t.integer :head_id, null: false
    end
  end
end
