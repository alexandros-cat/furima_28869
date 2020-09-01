class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
  validates :password, presence: true, confirmation: true
  validates :birthday, presence: true

  
  with_options format: {with: /\A[ぁ-んァ-ヶ一-龥]+\z/} do
    validates :family_name
    validates :first_name
  end
  with_options format: {with: /\A[ァ-ヶー－]+\z/} do
  validates :family_name_kana 
  validates :first_name_kana  
  end
end
