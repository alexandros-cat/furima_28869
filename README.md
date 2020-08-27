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
- has_many   :items
- belongs to :buyer

## itemsテーブル
| Column      | Type   | Options                      |
|-------------|--------|------------------------------|
|product_name | string | null: false                  |
| users_id    | integer| null: false foreign_key: true|
| category    | string | null: false                  |
| condition   | string | null: false                  |
| price       | string | null: false                  |
| origin      | string | null: false                  |
|Delivery days| date   | null: false                  |

### Association
- belongs_to :user
- belong_to :buyer 

## buyersテーブル
| Column   | Type   | Options                      |
|----------|--------|------------------------------|
| users_id | integer| null: false foreign_key: true|
| items_id | integer| null: false foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :shipping_address

## shipping_addressテーブル
| Column        | Type   | Options                      |
|---------------|--------| -----------------------------|
| buyer_id      | integer| null: false foreign_key: true|
| name          | string | null: false                  |
| state         | ENUM   | null: false                  |
| Postal code   | string | null: false                  |
| City          | string | null: false                  |
| Address Line  | string | null: false                  |
| Phone number  | string | null: false                  | 

### Association
- belongs_to :buyer
