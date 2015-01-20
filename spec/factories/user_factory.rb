FactoryGirl.define do
  factory :user do
    name "Eric Brown"
    email "example@example.com"
    password "password"
    password_confirmation "password"
  end
end
