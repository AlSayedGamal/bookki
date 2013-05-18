class Book < ActiveRecord::Base
  attr_accessible :isbn, :title
  letsrate_rateable "rating"
end
