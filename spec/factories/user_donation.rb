FactoryBot.define do
  factory :user_donation do
    token            { 42424242 }
   postal_code      { '11-123' }
   prefecture_id    { 2 }
   city             { '東京都' } 
   addresses        { '1-1' }
   building_name   { '東京ビル' }
   phone_code      {'09012345678'}
   association :user
   association :item
  end
end