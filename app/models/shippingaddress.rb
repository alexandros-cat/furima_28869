class Shippingaddress < ApplicationRecord
  belongs_to :buyer  # buyerテーブルとのアソシエーション
  
end
