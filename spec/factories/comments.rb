FactoryBot.define do
  factory :comment do
    comment { Faker::Lorem.characters(number:30) }
  end
end