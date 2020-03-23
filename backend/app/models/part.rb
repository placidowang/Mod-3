class Part < ApplicationRecord
  belongs_to :car
  has_one :part_attachment_joiner
  has_one :attachment, through: :part_attachment_joiner
end
