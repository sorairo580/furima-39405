# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| nickname           | string              | null: false               |
| last_name          | string              | null: false               |
| first_name         | string              | null: false               |
| last_name_kana     | string              | null: false               |
| first_name_kana    | string              | null: false               |
| birth_year_id      | integer             | null: false               |
| birth_month_id     | integer             | null: false               |
| birth_day_id       | integer             | null: false               |

### Association

- has_many :items
- has_many :purchase-records


## items table

| Column                  | Type       | Options                        |
|-------------------------|------------|--------------------------------|
| item_name               | string     | null: false                    |
| category_id             | integer    | null: false                    |
| price                   | integer    | null: false                    |
| item_description        | text       | null: false                    |
| condition_id            | integer    | null: false                    |
| cost_id                 | integer    | null: false                    |
| area_id                 | integer    | null: false                    |
| days_id                 | integer    | null: false                    |

### Association

- belongs_to :user
- has_one    :delivery-destinations
- has_one    :purchase_records


## purchases-records table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| purchaser   | references | null: false, foreign_key: true |
| item_info   | references | null: false, foreign_key: true |


### Association

- belongs_to :users
- has_many   :user_assemblys


## delivery-destinations table

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| zip_cord        | integer    | null: false                    |
| prifecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| house_number    | string     | null: false                    |
| room_number     | string     |                                |
| phone_number    | integer    | null: false                    |

### Association

- belongs_to :items
- has_one    :purchase_redords