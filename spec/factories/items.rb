FactoryBot.define do
  factory :item do
    product_name          { '商品名' }
    product_description   { '説明' }
    category_id           { 2 }
    product_condition_id  { 2 }
    product_burden_id     { 2 }
    ship_form_area_id     { 2 }
    shipping_days_id      { 2 }
    price                 { 5000 }
    association :user
  end
end
