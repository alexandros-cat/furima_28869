FactoryBot.define do
  factory :user_furima do
    token {"testggg"}
    postal_code       { "123-4567" }
    origin_id         { 2 } 
    city              { "千代田区"}
    address_line      { "1-1-1"}
    address_build     { "丸の内ビル"}  
    phone_number      { "09055281714" }
  end
end
