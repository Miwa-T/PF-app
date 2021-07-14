FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    account_name { Faker::Lorem.characters(number: 10) }
    introduction { Faker::Lorem.characters(number: 30) }
    password { 'password' }
    password_confirmation { 'password' }
    profile_image {File.open("#{Rails.root}/app/assets/images/img/logo.png")}
  end
end
