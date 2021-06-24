FactoryBot.define do
  factory :tag do
    tag_name { Faker::Lorem.characters(number: 8) }
    # #ハッシュタグつけて生成ってどうやって書くのか include #的な？
  end
end
