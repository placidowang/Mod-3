class AddWeightToAttachments < ActiveRecord::Migration[6.0]
  def change
    add_column :attachments, :weight, :integer
  end
end
