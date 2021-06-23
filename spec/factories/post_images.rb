FactoryBot.define do
  factory :post_image do
    explain { Faker::Lorem.characters(number:30) }
    title { Faker::Lorem.characters(number:10) }
    caption { Faker::Lorem.characters(number:8) }
  end
end