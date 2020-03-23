class AddPartAndAttachmentIdsToPartAttachmentJoiners < ActiveRecord::Migration[6.0]
  def change
    add_column :part_attachment_joiners, :part_id, :integer
    add_column :part_attachment_joiners, :attachment_id, :integer
  end
end
