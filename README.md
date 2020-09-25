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
|email                      |string |null: false|

### Association
- belongs_to :items
- has_many   :purchass_informations


## items テーブル

|Column                |Type   |Options    |
|----------------------|-------|-----------|
|product_name          |string |null: false|
|category_id           |integer|null: false|           
|producut_description  |text   |null: false|
|ship_from_area_id     |integer|null: false|
|shipping_days_id      |integer|null: false|
|price                 |integer|null: false|
|product_condition_id  |integer|null: false|
|product_burden_id     |integer|null: false|
|product_explantion    |text   |null: false|

### Association
- belongs_to :users
- has_one    :purchass_information

## purchase_informationsテーブル

|Column        |type       |option                       |
|--------------|-----------|-----------------------------|
|user_id       |integer    |null: false,foregin_key: true|
|item_id       |integer    |null: false,foregin_key: true|

### Association
- belongs_to :items
- belongs_to :users
- has_one    :shipping address

## shipping address テーブル

|Column               |type      |option                         | 
|---------------------|----------|-------------------------------|
|postal_code          |string     |                              |
|prefectures_id       |integer    |null: false                   |
|municipality         |string     |null: false                   |
|address              |string     |null: false                   |
|building_name        |string     |null: false                   |
|phone_code           |string     |null: false                   |
|purchase_information |references |nill: false,foregin_key: true |

### Association
- belongs_to :purchase_information





