FactoryBot.define do
  factory :item do
    name                   { 'スニーカー' }
    item_text              { '新品のスニーカーです' }
    condition_id           { 2 }
    shipping_charge_id     { 2 }
    origin_id              { 2 }
    delivery_days_id       { 2 }
    price                  { '500' }
    category_id            { 5 }
    user_id                { 1 }
  end
end
