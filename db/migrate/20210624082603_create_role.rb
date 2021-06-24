class CreateRole < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.integer :role_num, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
