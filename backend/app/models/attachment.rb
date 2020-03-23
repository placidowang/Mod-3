class Attachment < ApplicationRecord
  has_one :part_attachment_joiner
  has_one :part, through: :part_attachment_joiner
  has_one :car, through: :part
end
