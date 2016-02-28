FactoryGirl.define do
  factory :user do
    email 'Kappa@rails-experts.com'       #{ Faker::Internet.email }
    password 'Kappa123'
    password_confirmation 'Kappa123'
  end
end