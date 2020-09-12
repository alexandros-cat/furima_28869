class Buyer < ApplicationRecord
  belongs_to :item  # itemテーブルとのアソシエーション
  belongs_to :user  # usersテーブルとのアソシエーション

  
end
