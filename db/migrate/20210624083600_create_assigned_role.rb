class CreateAssignedRole < ActiveRecord::Migration[6.1]
  def change
    create_table :assigned_roles do |t|
      t.integer :user_id, null: false
      t.integer :role_id, null: false

    end
  end
end
