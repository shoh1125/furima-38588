# usersテーブル

| Column             | Type     | Options                  |
|--------------------|----------|--------------------------|
| nickname           | string   | null: false              |
| email              | string   | null: false  unique: true|
| encrypted_password | string   | null: false              |
| last_name          | text     | null: false              |
| family_name        | text     | null: false              |
| kana_last_name     | text     | null: false              |
| kana_family_name   | text     | null: false              |
| birth_date         | integer  | null: false              |

### Association
- has_many :items
- has_many :purchase_records


# itemsテーブル

| Column             | Type     | Options                       |
|--------------------|----------|-------------------------------|
| name               | string   | null: false                   |
| explanation        | text     | null: false                   |
| image              | image    | null: false                   |
| category           | text     | null: false                   |
| condition          | text     | null: false                   |
| delivery_charge    | string   | null: false                   |
| region             | string   | null: false                   |
| price              | integer  | null: false                   |
| user               |references| null: false,foreign_key: true |

### Association
- belongs_to :users
- has_one :purchase_records


# purchase_recordテーブル

| Column             | Type     | Options                       |
|--------------------|----------|-------------------------------|
| user               |references| null: false,foreign_key: true |
| item               |references| null: false,foreign_key: true |

### Association
- belongs_to :users
- belongs_to :items
- has_one :address

# addressテーブル

| Column             | Type     | Options                       |
|--------------------|----------|-------------------------------|
| post_code          | integer  | null: false                   |
| prefecture         | string   | null: false                   |
| municipality       | string   | null: false                   |
| address            | string   | null: false                   |
| building_name      | text     | null: false                   |
| tel_number         | integer  | null: false                   |
| purchase_record    |references| null: false, foreign_key: true|


### Association
- belongs_to :purchase_record

