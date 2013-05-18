class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #Rating
  letsrate_rater
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  # attr_accessible :title, :body

  def admin?
    self.admin == true
  end

  def books
    books = []
    ratings_given.each do |rating|
      books << rating.rateable_type.constantize.find(rating.rateable_id)
    end
    return books
  end
end
