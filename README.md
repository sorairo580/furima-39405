# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| name               | string              | null: false               |
| phon_number        | string              | null: false, unique: true |
| zip cord           | string              | null: false               |
| prifecture         | string              | null: false               |
| city               | string              | null: false               |
| house_number       | string              | null: false, unique: true |
| room_number        | string              |                           |

### Association

- has_many :items
- has_many :purchase-records
- has_one  :purchases
- has_one  :user_assenblys


## items table

| Column                  | Type       | Options                        |
|-------------------------|------------|--------------------------------|
| item name               | string     | null: false                    |
| category                | string     | null: false                    |
| price                   | string     | null: false                    |
| item description        | text       | null: false                    |
| message                 | text       | null: false                    |

### Association

- belongs_to :user
- has_one    :delivery-destinations


## purchases table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| card number | string     | null: false, unique: true      |
| valid thru  | string     | null: false                    |
| cvs         | string     | null: false                    |

### Association

- belongs_to :user


## purchases-records table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| record      | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_many   :user_assemblys


## user_assemblys table

| Column                | Type       | Options                        |
|-----------------------|------------|--------------------------------|
| user                  | references | null: false, foreign_key: true |
| delivery destinations | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :delivery-destinations
- belongs_to :purchase-records

## delivery-destinations table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :items
- has_one    :user_assemblys