## usersテーブル

| Column  | Type  | Options     |
|---------|-------|-------------|
| name    | string| null: false |
| katakana| string| null: false | 
| nickname| string| null: false |
| email   | string| null: false |
| password| string| null: false |
| birthday| string| null: false |

### Association
- has_many   :items
- belongs to :buyers

## itemsテーブル
| Column   | Type      | Options     |
|----------|-----------|-------------|
| contents | string    | null: false |
| category | string    | null: false |
| price    | string    | null: false |
| users_id | references| null: false |

### Association
- belongs_to :user
- 

## buyersテーブル
| Column   | Type      | Options     |
|----------|-----------|-------------|
| users-id | references| null: false |
| items-id | references| null: false |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :shipping_address

## shipping_addressテーブル
| Column        | Type      | Options     |
|---------------|-----------| ------------|
| buyer-id      | references| null: false |
| name          | string    | null: false |
| Postal code   | string    | null: false |
| State         | string    | null: false |
| City          | string    | null: false |
| Address Line  | string    | null: false |
| Phone number  | string    | null: false |

### Association
- belongs_to :buyer
