class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :items
  # has_many :purchase_records

  validates :nickname, presence: true
  validates :encrypted_password, 
             format: { with:  /\A[a-zA-Z0-9]+\z/},
             presence: true
  validates :last_name, 
             format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/},
             presence: true
  validates :family_name,
             format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/},
             presence: true
  validates :kana_last_name,
             format: { with: /\A([ァ-ン]|ー)+\z/},
             presence: true
  validates :kana_family_name,
             format: { with: /\A([ァ-ン]|ー)+\z/},
             presence: true
  validates :birth_date, presence: true

end
