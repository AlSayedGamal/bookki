FactoryGirl.define do
  factory (:user) do
    username        { Forgery(:name).first_name }
    email           { Forgery(:internet).email_address }
    password        { Forgery(:basic).password(at_least: 8) }

    trait(:admin) do
      after(:create) do |user|
        user.update_attributes(admin: true)
      end
    end
  end
end