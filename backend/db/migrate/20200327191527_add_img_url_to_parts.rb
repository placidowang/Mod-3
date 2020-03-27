class AddImgUrlToParts < ActiveRecord::Migration[6.0]
  def change
    add_column :parts, :img_url, :string
  end
end
