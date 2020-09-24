# データーベースの設計

## users テーブル

|   Column                  | Type  | Options   |
|---------------------------|-------|-----------|
|nickname                   |string |null: false|
|name_kana                  |string |null: false|
|name_full_width_character  |string |null: false|
|password                   |string |null: false|
|birthday                   |integer|null: false|
|email                      |string |nill: false|

### Association
- has_many :users 
- has_many :items
- has_many :buyeruser
- has_many :comment

## items テーブル

|Column                |Type   |Options    |
|----------------------|-------|-----------|
|product name          |string |null: false|
|category              |string |null: false|
|price                 |integer|nill: false|
|product condition     |string |nill: false|
|product image         |string |nill: false|
|producut description  |text   |nill: false|
|ship-from area        |string |nill: false|
|Shipping days         |integer|nill: false|

### Association
- has_many :users 
- has_many :items
- has_many :buyeruser
- has_many :comment

## comment テーブル

|Column   |type       |option     |
|---------|-----------|-----------|
|buyeruser|references |foregin_key|
|text     |text       |nill :false|

### Association
- has_many :users 
- has_many :items
- has_many :buyeruser
- has_many :comment

## buyeruser テーブル

|Column        |type   |option     |
|--------------|-------|-----------|
|phone numder  |integer|nill: false|
|buyer address |string |nill: false|
|postal cood   |integer|nill: false|

### Association
- belongs_to :buyeruser

## shipping address テーブル

|Column            |type       |option                        |
|------------------|-----------|------------------------------|
|shipping days     |references |nill: false,foregin_key: true |
|buyer addres      |references |nill: false,foregin_key: true |
|buyer_information |references |nill: false,foregin_key: true  |

### Association
- belongs_to :buyeruser


