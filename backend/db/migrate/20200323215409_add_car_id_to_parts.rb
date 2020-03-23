class AddCarIdToParts < ActiveRecord::Migration[6.0]
  def change
    add_column :parts, :car_id, :integer
  end
end
