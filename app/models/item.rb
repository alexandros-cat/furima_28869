class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :origin
  belongs_to_active_hash :delivery_day
  belongs_to_active_hash :shipping_charge
  has_one_attached :image
  belongs_to :user
  has_one :buyer

  # 空の投稿を保存できないようにする

  validates :name, presence: true
  validates :item_text, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :origin_id, presence: true
  validates :delivery_days_id, presence: true
  validates :shipping_charge_id, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300,
                                    less_than_or_equal_to: 9_999_999 }
  validates_format_of :price, with: /\A[0-9]+\z/

  # ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :origin_id, numericality: { other_than: 1 }
  validates :delivery_days_id, numericality: { other_than: 1 }
  validates :shipping_charge_id, numericality: { other_than: 1 }
  validates :user_id, presence: true
end

# エラーハンドリングができていること
# （適切では無い値が入力された場合、情報は保存されず、エラーメッセージを出力させる）
