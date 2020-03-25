class AddSpecsToAttachments < ActiveRecord::Migration[6.0]
  def change
    add_column :attachments, :change_in_top_speed, :integer
    add_column :attachments, :change_in_acceleration, :integer
    add_column :attachments, :change_in_handling, :integer
  end
end
