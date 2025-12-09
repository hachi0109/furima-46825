## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| name               | string  | null: false |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false |
| family_name        | string  | null: false |
| first_name         | string  | null: false |
| family_name_kana   | string  | null: false |
| first_name_kana    | string  | null: false |
| birthday           | date    | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| name               | string     | null: false |
| price              | integer    | null: false |
| explanation        | text       | null: false |
| category_id        | integer    | null: false |
| status_id          | integer    | null: false |
| shipping_cost_id   | integer    | null: false |
| prefecture_id      | integer    | null: false |
| shipping_date_id   | integer    | null: false |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :shipping_cost
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :shipping_date

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ------------|
| post_code     | string     | null: false |
| prefecture_id | integer    | null: false |
| town          | string     | null: false |
| street        | string     | null: false |
| building      | string     |             |
| phone         | string     | null: false |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order
- belongs_to_active_hash :prefecture