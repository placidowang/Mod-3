class AddSpecsToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :base_top_speed, :integer
    add_column :cars, :base_acceleration, :integer
    add_column :cars, :base_handling, :integer
  end
end
