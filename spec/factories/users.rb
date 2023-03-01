FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name {'太郎'}
    family_name {'田中'}
    kana_last_name {'タロウ'}
    kana_family_name {'タナカ'}
    birth_date {Faker::Date.birthday}

  end
end