# データーベースの設計

## users テーブル

|Column   |Type  |Options    |
|---------|------|-----------|
|nickname |string|null: false|
|name     |string|null: false|
|email    |string|null: false|
|password |string|null: false|

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


## buyer テーブル

|Column        |type   |option     |
|--------------|-------|-----------|
|phone numder  |integer|nill: false|
|buyer address |string |nill: false|
|postal cood   |integer|nill: false|

## comment テーブル

|Column   |type       |option     |
|---------|-----------|-----------|
|buyer    |references |foregin_key|
|text     |text       |nill :false|

## shipping address テーブル

|Column        |type       |option                        |
|--------------|-----------|------------------------------|
|shipping days |references |nill: false,foregin_key: true |
|buyer addres  |references |nill: false,foregin_key: true |
|buyer         |references |nill: false,foregin_key: true |



### Association

- has_many :users 
- has_many :items
- has_many :buyer
- has_many :comment

### Association
- belogs_to :buyer