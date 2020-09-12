class Shippingaddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :origin
  belongs_to :buyer  # buyerテーブルとのアソシエーション
  with_options presence: true do
    validates :buyer_id 
    validates :origin_id 
    validates :postal_code
    validates :city 
    validates :address_line
    validates :address_build
    validates :phone_number
  end  
    validates :postal_code, format:{ with: /\A\d{3}[-]\d{4}\z/ } 
    validates :phone_number, format:{ with: /\A\d{11}\z/} 
end
