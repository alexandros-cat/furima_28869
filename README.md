## usersテーブル

| Column          | Type  | Options     |
|-----------------|-------|-------------|
| family_name     | string| null: false |
| first_name      | string| null: false |
| family_name_kana| string| null: false |
| first_name_kana | string| null: false | 
| nickname        | string| null: false |
| email           | string| null: false |
| password        | string| null: false |
| birthday        | date  | null: false |

### Association
- has_many  :items
- has_many  :buyers
- has_many  :comments

## itemsテーブル
| Column           | Type   | Options                      |
|------------------|--------|------------------------------|
| name             |string  | null: false                  |
| item_text        |string  | null: false                  |
| user_id          |integer | null: false foreign_key: true|
| price            |integer | null: false                  |
| category_id      |integer | null: false                  |
| condition_id     |integer | null: false                  |
| origin_id        |integer | null: false                  |
|delivery_days_id  |integer | null: false                  |
|shipping_charge_id|integer | null: false                  |



### Association
- belongs_to :user
- has_one :buyer 
- has_many  :comments


## buyersテーブル
| Column   | Type    | Options                      |
|----------|---------|------------------------------|
| user_id  | integer | null: false foreign_key: true|
| item_id  | integer | null: false foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addressテーブル
| Column        | Type   | Options                      |
|---------------|--------| -----------------------------|
| buyer_id      | integer| null: false foreign_key: true|
| origin_id     | integer| null: false                  |
| postal_code   | string | null: false                  |
| city          | string | null: false                  |
| address_line  | string | null: false                  |
| address_build | string |                              |
| phone number  | string | null: false                  | 

### Association
- belongs_to :buyer

## commentsテーブル
| Column        | Type   | Options                      |
|---------------|--------| -----------------------------|
| user_id       | integer| null: false foreign_key: true|
| item_id       | integer| null: false foreign_key: true|
| text          | string | null: false                  |

### Association
- belongs_to :user
- belongs_to :item