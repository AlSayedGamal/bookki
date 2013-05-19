class Rate < ActiveRecord::Base
  belongs_to :rater, :class_name => "User"
  belongs_to :rateable, :polymorphic => true
  
  attr_accessible :rate, :dimension, :stars

  def book
    rateable_type.constantize.find(rateable_id)
  end

  def rater
    User.find(rater_id)
  end
  
end