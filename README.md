# データーベースの設計

## users テーブル

|   Column                  | Type  | Options   |
|---------------------------|-------|-----------|
|nickname                   |string |null: false|
|fist_name_kana             |string |null: false|
|last_name_kana             |storing|nill: false|
|first_name                 |string |null: false|
|last_name                  |string |null: false|
|password                   |string |null: false|
|birthday                   |date   |null: false|
|email                      |string |nill: false|

### Association
- has_many :items
- has_many :buyeruser
- has_many :comment

## items テーブル

|Column                |Type   |Options    |
|----------------------|-------|-----------|
|product_name          |string |null: false|
|category              |integer|null: false|           
|producut_description  |text   |nill: false|
|ship-from_area        |integer|nill: false|
|Shipping days         |integer|nill: false|
|price                 |integer|nill: false|
|product_condition     |integer|nill: false|
|product_burden        |string |nill: false|

### Association
- has_many :items
- has_many :buyeruser
- has_many :comment

## comment テーブル

|Column   |type       |option     |
|---------|-----------|-----------|
|buyeruser|references |foregin_key|
|text     |text       |nill :false|

### Association
- has_many :items
- has_many :buyeruser
- has_many :comment

## buyeruser テーブル

|Column        |type   |option     |
|--------------|-------|-----------|
|phone_numder  |integer|nill: false|
|buyer_address |string |nill: false|
|postal_cood   |integer|nill: false|

### Association
- belongs_to :user

## shipping address テーブル

|Column            |type       |option                        |
|------------------|-----------|------------------------------|
|shipping_days     |references |nill: false,foregin_key: true |
|buyer_addres      |integer    |nill: false                  |
|buyer_information |references |nill: false,foregin_key: true |

### Association
- bilongs_to :user



