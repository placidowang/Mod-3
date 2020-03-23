class PartAttachmentJoiner < ApplicationRecord
  belongs_to :part
  belongs_to :attachment
end
