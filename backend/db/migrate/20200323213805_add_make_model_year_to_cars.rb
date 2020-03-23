class AddMakeModelYearToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :make, :string
    add_column :cars, :model, :string
    add_column :cars, :year, :string
  end
end
