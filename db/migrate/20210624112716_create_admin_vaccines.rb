class CreateAdminVaccines < ActiveRecord::Migration[6.1]
  def change
    create_table :admin_vaccines do |t|
      t.string :name, null: false
      t.integer :no_of_doses, null: false
      t.integer :days_to_sec_dose, null: false
      t.integer :amount, null: false
    end
  end
end
