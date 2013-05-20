def create_guest
  FactoryGirl.attributes_for :user
end

def create_user(user_hash = {})
  confirmed = user_hash.delete(:confirmed)

  if confirmed.nil?
    FactoryGirl.create :user, user_hash
  else
    FactoryGirl.create :user, :confirmed_user, user_hash
  end
end
