FactoryBot.define do
  factory :item do
    name {Faker::Name.name}
    explanation {'これは説明です。'}
    category_id {'2'}
    condition_id {'2'}
    delivery_charge_id {'2'}
    prefecture_id {'2'}
    delivery_date_id {'2'}
    price {'50000'}
    
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test-image.png'), filename: 'test-image.png')
    end
  end
end
