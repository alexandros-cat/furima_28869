class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :origin
  belongs_to_active_hash :delivery_days
  belongs_to_active_hash :shipping_charge
  has_many_attached :images
  belongs_to :user
  has_one :buyer
  has_many :comments

  # 空の投稿を保存できないようにする
  with_options presence: true do
    validates :name
    validates :item_text
    validates :category_id
    validates :condition_id
    validates :origin_id
    validates :delivery_days_id
    validates :shipping_charge_id
    validates :price
    validates :user_id
    validates :images
  end
  validates :price, numericality: { greater_than_or_equal_to: 300,
                                    less_than_or_equal_to: 9_999_999 }
  validates_format_of :price, with: /\A[0-9]+\z/

  # ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :condition_id
  validates :origin_id
  validates :delivery_days_id
  validates :shipping_charge_id
  end
  def self.search(search)
    if search != ""
      Item.where('name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end

# エラーハンドリングができていること
# （適切では無い値が入力された場合、情報は保存されず、エラーメッセージを出力させる）
