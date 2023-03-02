FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    encrypted_password {password}
    last_name {'太郎'}
    family_name {'田中'}
    kana_last_name {'タロウ'}
    kana_family_name {'タナカ'}
    birth_date {Faker::Date.birthday}

  end
end