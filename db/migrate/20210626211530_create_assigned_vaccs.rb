class CreateAssignedVaccs < ActiveRecord::Migration[6.1]
  def change
    create_table :assigned_vaccs do |t|
      t.integer :user_id, index: true, null: false
      t.integer :vaccine_id, index: true, null: false
      t.integer :vaccine_center_id, index: true, null: false
    end
  end
end
