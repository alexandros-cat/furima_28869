class Shippingaddress < ApplicationRecord
  belongs_to :buyer  # buyerテーブルとのアソシエーション
  belongs_to_active_hash :origin
  with_options presence: true do
    validates :buyer_id 
    validates :origin_id 
    validates :postal_code
    validates :city 
    validates :address_line
    validates :address_build
    validates :phone_number
   
    validates :postal_code, ^\d{3}-\d{4}$  
    validates :phone_number, ^0\d{9,10}$
end
