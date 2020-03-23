class AddNameToAttachments < ActiveRecord::Migration[6.0]
  def change
    add_column :attachments, :name, :string
  end
end
