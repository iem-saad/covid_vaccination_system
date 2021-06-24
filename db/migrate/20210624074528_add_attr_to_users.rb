class AddAttrToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :salary, :integer, default: nil
    add_column :users, :staff_position, :string
    add_column :users, :vac_pin, :string, default: ''
    add_column :users, :vac_stage, :integer, default: nil
  end
end
