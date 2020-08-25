## usersテーブル

| Column  | Type  | Options     |
| --------| ------| ------------|
| nickname| string| null: false |
| email   | string| null: false |
| password| string| null: false |

### Association
- has_many :items
- has_many :buyers

## itemsテーブル
| Column   | Type  | Options     |
| ---------| ------| ------------|
| contents | string| null: false |
| category | string| null: false |
| price    | string| null: false |
| Exhibitor| string| null: false |
| users_id | string| null: false |
| buyers-id| string| null: false |

### Association
- belongs_to :users
- belongs_to :items

## buyersテーブル
| Column   | Type  | Options     |
| ---------| ------| ------------|
| users-id | string| null: false |

### Association
- belongs_to :users
- has_many   :items
- belongs_to :shipping_address

## shipping_addressテーブル
| Column   | Type  | Options     |
| ---------| ------| ------------|
| buyer-id | string| null: false |
| name     | string| null: false |
| address  | string| null: false |
### Association
- belongs_to :buyers
