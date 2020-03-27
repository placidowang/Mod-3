class AddImgUrlToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :img_url, :string
  end
end
