FactoryBot.define do
  factory :item do
    Faker::Config.locale = :ja

    image{Faker::Lorem.sentence}#=> loremな文章 
    name {Faker::Lorem.sentence}
    item_text {Faker::Lorem.sentence}
    category_id {Faker::Lorem.sentence}
    condition_id {Faker::Lorem.sentence}
    shipping_charge_id {Faker::Lorem.sentence}
    origin_id {Faker::Lorem.sentence}
    delivery_days_id {Faker::Lorem.sentence}  
    price {Faker::Lorem.sentence} 
    user_id {Faker::Lorem.sentence}
    

    association :image
    association :user     
    association :category 
    association :condition 
    association :origin
    association :delivery_day
    association :shipping_charge

  end
end
