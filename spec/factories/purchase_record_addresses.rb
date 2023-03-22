FactoryBot.define do
  factory :purchase_record_address do
    post_code { '123-4567' }
    prefecture_id { 2 }
    municipality { '東京都' }
    address { '中央区京橋1-1' }
    building_name { '東京ハイツ' }
    tel_number { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
