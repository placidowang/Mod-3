class AddWeightToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :weight, :integer
  end
end
