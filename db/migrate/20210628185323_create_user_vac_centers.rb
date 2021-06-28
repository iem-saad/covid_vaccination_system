class CreateUserVacCenters < ActiveRecord::Migration[6.1]
  def change
    create_view :user_vac_centers
  end
end
