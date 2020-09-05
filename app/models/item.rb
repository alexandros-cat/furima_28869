class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category 
  belongs_to_active_hash :condition 
  belongs_to_active_hash :origin
  belongs_to_active_hash :delivery_day
  belongs_to_active_hash :shipping_charge
  has_one_attached :image
  belongs_to :user


  #空の投稿を保存できないようにする
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :origin_id, presence: true
  validates :delivery_days_id, presence: true
  validates :shipping_charge_id, presence: true 

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 } 
  validates :origin_id, numericality: { other_than: 1 } 
  validates :delivery_days_id, numericality: { other_than: 1 } 
  validates :shipping_charge_id, numericality: { other_than: 1 } 
end

