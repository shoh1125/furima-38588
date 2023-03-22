class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase_record
  has_one_attached :image

  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true,
                          numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, presence: true,
                           numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_charge_id, presence: true,
                                 numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, presence: true,
                            numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_date_id, presence: true,
                               numericality: { other_than: 1, message: "can't be blank" }
  validates :price,
            numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                            message: 'is invalid!' }
  validates :image, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :delivery_date
  belongs_to :prefecture
end
