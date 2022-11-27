# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ----------- ------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| date_of_birthday   | date   | null: false               |

## Association

- has_many :item
- has_many :purchases_history



### items テーブル

| Column                | Type        | Options                        |
| --------------------  | ----------- | ------------------------------ |
| product_name          | string      | null: false                    |
| discription           | text        | null: false                    |
| category              | references  | null: false                    |
| condition             | references  | null: false                    |
| charge                | references  | null: false                    |
| area                  | references  | null: false                    |
| delivery_days         | references  | null: false                    |
| price                 | integer     | null: false                    |
| users                 | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_history

#### purchase_histories テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| users                 | references | null: false, foreign_key: true |
| items                 | references | null: false, foreign_key: true |


#### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

##### shipping_addresses テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| post_code             | string     | null: false                    |
| area                  | references | null: false                    |
| municipality          | string     | null: false                    |
| address               | string     | null: false                    |
| municipality          | string     | null: false                    |
| building_name         | string     |                                |
| phone_number          | string     | null: false                    |
| purchases_history     | references | null: false, foreign_key: true |


##### Association

- belongs_to :purchases_history
