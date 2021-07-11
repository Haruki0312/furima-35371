# テーブル設計

## users テーブル

| Column          | Type   | Options                   |
| --------------- | ------ | ------------------------- |
| nickname        | string | null: false               |
| email           | string | null: false, unique: true |
| password        | string | null: false               |
| last_name       | string | null: false               |
| first_name      | string | null: false               |
| last_name_kana  | string | null: false               |
| first_name_kana | string | null: false               |
| birth_date      | date   | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| name         | string     | null: false       |
| info         | text       | null: false       |
| category     | string     | null: false       |
| status       | string     | null: false       |
| shipping_fee | string     | null: false       |
| prefecture   | string     | null: false       |
| schedule     | string     | null: false       |
| price        | integer    | null: false       |
| user         | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column    | Type       | Options           |
| --------- | ---------- | ----------------- |
| user      | references | foreign_key: true |
| item      | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_many :addresses

## addresses テーブル

| Column      | Type       | Option            |
| ----------- | ---------- | ----------------- |
| postal_code | integer    | null: false       |
| prefecture  | string     | null: false       |
| city        | string     | null: false       |
| address     | string     | null: false       |
| building    | string     |                   |
| tel_number  | integer    | null: false       |
| order       | references | foreign_key: true |

### Association

- belongs_to :order