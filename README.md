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
| birthday_id        | date                | null: false               |

### Association

- has_many :items
- has_many :purchase-records


## items table

| Column                  | Type          | Options                        |
|-------------------------|---------------|--------------------------------|
| item_name               | string        | null: false                    |
| category_id             | integer       | null: false                    |
| price                   | integer       | null: false                    |
| item_description        | text          | null: false                    |
| condition_id            | integer       | null: false                    |
| cost_id                 | integer       | null: false                    |
| area_id                 | integer       | null: false                    |
| delivery_days_id        | integer       | null: false                    |
| user                    | references    | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :delivery-destinations



## purchases-records table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| item_info   | references | null: false, foreign_key: true |


### Association

- has_many :delivery-destinations


## delivery-destinations table

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| zip_cord        | string     | null: false                    |
| prifecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| house_number    | string     | null: false                    |
| room_number     | string     |                                |
| phone_number    | integer    | null: false                    |
| item_info       | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_redords
