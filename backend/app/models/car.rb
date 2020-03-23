class Car < ApplicationRecord
  has_many :parts
  has_many :attachments, through: :parts
end
