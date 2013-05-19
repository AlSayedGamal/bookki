FactoryGirl.define do
  factory (:user) do
    username        { Forgery(:name).first_name }
    email             { Forgery(:internet).email_address }
    password          { Forgery(:basic).password(at_least: 8) }
  end
end