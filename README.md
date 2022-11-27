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

- has_many :items
- has_many :purchases_historys



### items テーブル

| Column                | Type        | Options     |
| --------------------  | ----------- | ----------- |
| image                 | text        | null: false |
| product_name          | text        | null: false |
| discription           | text        | null: false |
| category_id           | references  | null: false |
| condition_id          | references  | null: false |
| charge_id             | references  | null: false |
| area_id               | references  | null: false |
| delivery_days_id      | references  | null: false |
| price                 | integer     | null: false |
| users_id              | references  | null: false |

### Association

- belongs_to :users
- has_one :purchases_historys

#### purchases_historys テーブル

| Column                | Type       | Options     |
| --------------------- | ---------- | ----------- |
| users_id              | references | null: false |
| items_id              | references | null: false |


#### Association

- belongs_to :users
- belongs_to :items
- has_one :shipping addresses

##### shipping_addressess テーブル

| Column                | Type       | Options     |
| --------------------- | ---------- | ----------- |
| post_code             | string     | null: false |
| prefectures           | string     | null: false |
| municipality          | string     | null: false |
| phone_number          | string     | null: false |
| items_id              | references | null: false |


##### Association

- belongs_to :purchases_historys
