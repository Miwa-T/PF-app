FactoryBot.define do
  factory :post_image do
    image {File.open("#{Rails.root}/app/assets/images/img/logo.png")}
    explain { Faker::Lorem.characters(number: 30) }
    title { Faker::Lorem.characters(number: 10) }
    caption { Faker::Lorem.characters(number: 8) }
    user
  end
end
