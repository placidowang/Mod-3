class CreatePartAttachmentJoiners < ActiveRecord::Migration[6.0]
  def change
    create_table :part_attachment_joiners do |t|

      t.timestamps
    end
  end
end
