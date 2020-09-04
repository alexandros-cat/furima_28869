class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category 
  belongs_to_active_hash :condition 
  belongs_to_active_hash :origin
  belongs_to_active_hash :delivery_day
  belongs_to_active_hash :shipping_charge


  #空の投稿を保存できないようにする
  validates :category, presence: true
  validates :condition, presence: true
  validates :origin, presence: true
  validates :delivery_days, presence: true
  validates :shipping_charge, presence: true 

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category, numericality: { other_than: 1 } 
  validates :condition, numericality: { other_than: 1 } 
  validates :origin, numericality: { other_than: 1 } 
  validates :delivery_days, numericality: { other_than: 1 } 
  validates :shipping_charge, numericality: { other_than: 1 } 
end

