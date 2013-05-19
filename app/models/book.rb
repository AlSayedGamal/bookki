class Book < ActiveRecord::Base
  attr_accessible :isbn, :title
  letsrate_rateable "rating"

  validate :check_length
  validates :isbn, :numericality => { :only_integer => true }, :uniqueness => true
  validates :title, :presence => true

  def check_length
    unless isbn.size == 10 or isbn.size == 13
      errors.add(:isbn, "length must be 10 or 13") 
    end
  end

  def overall_rating=(stars)
    rating_rates.update_all stars: stars
  end
end
