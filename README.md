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
- bilongs_to :items
- has_one    :purchass_informations


## items テーブル

|Column                |Type   |Options    |
|----------------------|-------|-----------|
|product_name          |string |null: false|
|category_id           |integer|null: false|           
|producut_description  |text   |nill: false|
|ship_from_area_id     |integer|nill: false|
|shipping_days_id      |integer|nill: false|
|price                 |integer|nill: false|
|product_condition_id  |integer|nill: false|
|product_burden_id     |integer|nill: false|
|product_explantion    |text   |nill: false|

### Association
- bilongs_to :users
- has_many :purchass_information

## purchase_informationsテーブル

|Column        |type       |option                       |
|--------------|-----------|-----------------------------|
|user_id       |references |nill: false,foregin_key: true|
|item_id       |references |nill: false,foregin_key: true|

### Association
- bilongs_to :items
- belongs_to :users

## shipping address テーブル

|Column            |type       |option                        |
|------------------|-----------|------------------------------|
|shipping_days     |references |nill: false,foregin_key: true |
|buyer_addres      |integer    |nill: false                   |
|buyer_information |references |nill: false,foregin_key: true |
|postal_code       |string     |nill: false                   |
|prefectures_id    |integer    |nill: false                   |
|municipality      |string     |nill: false                   |
|address           |string     |nill: false                   |
|building_name     |string     |nill: false                   |
|phone_code        |string     |nill: false                   |

### Association
- bilongs_to :items
- 



