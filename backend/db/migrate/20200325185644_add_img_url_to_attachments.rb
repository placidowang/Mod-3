class AddImgUrlToAttachments < ActiveRecord::Migration[6.0]
  def change
    add_column :attachments, :img_url, :string
  end
end
