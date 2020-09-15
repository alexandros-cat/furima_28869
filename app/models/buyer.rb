class Buyer < ApplicationRecord
  belongs_to :item  # itemテーブルとのアソシエーション
  belongs_to :user  # usersテーブルとのアソシエーション
  has_one :shippingaddress  # shippingaddressテーブルとのアソシエーション
  
end
