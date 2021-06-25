class CreateAdminAllocatedVaccs < ActiveRecord::Migration[6.1]
  def change
    create_table :admin_allocated_vaccs do |t|
      t.integer :vac_id, null: false
      t.integer :center_id, null: false
      t.integer :amount, null: false
    end
  end
end
