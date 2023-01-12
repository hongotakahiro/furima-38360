class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :purchase_history

  validates :image,               presence: true
  validates :product_name,        presence: true
  validates :price,               presence: true,
                                  numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :charge_id,           numericality: { other_than: 1, message: "can't be blank" }
  validates :description,         presence: true
  validates :category_id,         numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id,        numericality: { other_than: 1, message: "can't be blank" }
  validates :area_id,             numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_days_id,    numericality: { other_than: 1, message: "can't be blank" }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :charge
  belongs_to :condition
  belongs_to :delivery_days
end
