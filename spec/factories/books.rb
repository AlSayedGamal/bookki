FactoryGirl.define do
  factory :book do    
    title  {Forgery::Name.first_name}
    isbn {(1234123412000 + rand( 111..999)).to_s }
  end
end
