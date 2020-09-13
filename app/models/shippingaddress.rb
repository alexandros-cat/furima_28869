class Shippingaddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :origin
  belongs_to :buyer  # buyerテーブルとのアソシエーション
  attr_accessor :token
end
