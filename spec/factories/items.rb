FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    explanation { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 2, to: 11) }
    status_id { Faker::Number.between(from: 2, to: 7) }
    shipping_cost_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    shipping_date_id { Faker::Number.between(from: 2, to: 4) }
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_img.png'), filename: 'test_img.png')
    end
    
  end
end
