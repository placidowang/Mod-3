class Car < ApplicationRecord
  has_many :parts
  has_many :attachments, through: :parts

  def calculate_final_top_speed
    final_top_speed = self.base_top_speed
    self.attachments.each do |attachment|
      final_top_speed += attachment.change_in_top_speed
    end
    final_top_speed
  end

  def calculate_final_acceleration
    final_acceleration = self.base_acceleration
    self.attachments.each do |attachment|
      final_acceleration += attachment.change_in_acceleration
    end
    final_acceleration
  end

  def calculate_final_handling
    final_handling = self.base_handling
    self.attachments.each do |attachment|
      final_handling += attachment.change_in_handling
    end
    final_handling
  end
  def calculate_final_weight
    final_weight = self.weight 
    self.attachments.each do |attachment|
      final_weight += attachment.weight 
    end
    final_weight
  end
  
end
