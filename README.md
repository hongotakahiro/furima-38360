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

| Column             | Type   | Options                        |
| ------------------ | ------ | ----------- ------------------ |
| email              | string | null: false, foreign_key: true |
| password           | string | null: false                    |
| name               | string | null: false                    |
| kana               | string | null: false                    |
| date of birthday   | date   | null: false                    |

## Association

- has_many :items


### items テーブル

| Column       | Type        | Options     |
| ------------ | ----------- | ----------- |
| product name | text        | null: false |
| discription  | text        | null: false |
| category     | text        | null: false |
| condition    | text        | null: false |
| price        | integer     | null: false |
| users_id     | integer     | null: false |

### Association

- belongs_to :users
- has_one :buyers
- has_one :shipping addresses


#### buyers テーブル

| Column                | Type       | Options     |
| --------------------- | ---------- | ----------- |
| post code             | integer    | null: false |
| prefectures           | string     | null: false |
| Municipality          | string     | null: false |
| phone number          | string     | null: false |
| items_id              | integer    | null: false |


#### Association

- belongs_to :items
- has_one :buyers
- has_one :shipping addresses


##### shippinmg addresses テーブル

| Column                | Type       | Options     |
| --------------------- | ---------- | ----------- |
| charge                | integer    | null: false |
| area                  | string     | null: false |
| date of ship          | date       | null: false |
| items_id              | integer    | null: false |
| buyers_id             | integer    | null: false |




##### Association

- belongs_to :buyers