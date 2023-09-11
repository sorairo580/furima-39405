# DB 設計

## users table

| Column             | Type   | Options                   |
|--------------------|--------|---------------------------|
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :purchase_records


## items table

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| item_name        | string     | null: false                    |
| category_id      | integer    | null: false                    |
| price            | integer    | null: false                    |
| item_description | text       | null: false                    |
| condition_id     | integer    | null: false                    |
| cost_id          | integer    | null: false                    |
| prifecture_id    | integer    | null: false                    |
| delivery_day_id  | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase_record


## purchase_records table

| Column | Type       | Options                        |
|--------|------------|--------------------------------|
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- has_one    :delivery_destination
- belongs_to :item
- belongs_to :user


## delivery_destinations table

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| zip_cord      | string     | null: false                    |
| prifecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| room_number   | string     |                                |
| phone_number  | string     | null: false, unique: true      |
| item          | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_record
