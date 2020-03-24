class PartAttachmentJoiner < ApplicationRecord
  belongs_to :part
  belongs_to :attachment

  validates :part_id, uniqueness: true
  validates :attachment_id, uniqueness: true
end
