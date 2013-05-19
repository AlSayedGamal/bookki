FactoryGirl.define do
  factory :book do    
    title  {Forgery::Monetary.money}
    isbn {(1234123412000 + rand( 111..999)).to_s }
  end
end
