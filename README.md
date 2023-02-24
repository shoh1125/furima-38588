# usersテーブル

| Column             | Type     | Options                  |
|--------------------|----------|--------------------------|
| nickname           | string   | null: false              |
| email              | string   | null: false  unique: true|
| encrypted_password | string   | null: false              |
| last_name          | string   | null: false              |
| family_name        | string   | null: false              |
| kana_last_name     | string   | null: false              |
| kana_family_name   | string   | null: false              |
| birth_date         | date     | null: false              |

### Association
- has_many :items
- has_many :purchase_records


# itemsテーブル

| Column             | Type     | Options                       |
|--------------------|----------|-------------------------------|
| name               | string   | null: false                   |
| explanation        | text     | null: false                   |
| category_id        | integer  | null: false                   |
| condition_id       | integer  | null: false                   |
| delivery_charge_id | integer  | null: false                   |
| prefecture_id      | integer  | null: false                   |
| delivery_date_id   | integer  | null: false
| price              | integer  | null: false                   |
| user               |references| null: false,foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase_record


# purchase_recordsテーブル

| Column             | Type     | Options                       |
|--------------------|----------|-------------------------------|
| user               |references| null: false,foreign_key: true |
| item               |references| null: false,foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

# addressesテーブル

| Column             | Type     | Options                       |
|--------------------|----------|-------------------------------|
| post_code          | string   | null: false                   |
| prefecture_id      | integer  | null: false                   |
| municipality       | string   | null: false                   |
| address            | string   | null: false                   |
| building_name      | string   |                               |
| tel_number         | string   | null: false                   |
| purchase_record    |references| null: false, foreign_key: true|


### Association
- belongs_to :purchase_record

