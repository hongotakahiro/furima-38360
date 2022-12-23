FactoryBot.define do
  factory :item do
    product_name { '絵' }
    description { 'トラの絵' }
    category_id { 3 }
    condition_id { 3 }
    charge_id { 3 }
    area_id { 3 }
    delivery_days_id { 3 }
    price { 4000 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    association :user
  end
end
