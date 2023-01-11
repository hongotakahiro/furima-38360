FactoryBot.define do
  factory :purchase_address do
    # user { '鈴木' }
    # item_id { 3 }

    post_code { '123-4567' }
    area_id { 3 }
    municipality { '京都市' }
    address { '青山' }
    building_name { '柳ビル' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
