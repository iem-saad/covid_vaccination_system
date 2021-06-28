class CreateInjectedVaccs < ActiveRecord::Migration[6.1]
  def change
    create_table :injected_vaccs do |t|
      t.integer :user_id, null: false
      t.integer :vacc_id, null: false
    end
  end
end
