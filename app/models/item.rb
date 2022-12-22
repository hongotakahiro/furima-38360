class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  # has_one_attached :image
  # validates :image, :product_name, :description, :category_id, :condition_id, :charge_id, :area_id, :delivery_days_id, :price, :user, presence: true

  validates :product_name,        presence: true
  validates :price,               numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :charge_id,           numericality: { other_than: 1, message: "can't be blank" }
  validates :description,         presence: true
  validates :category_id,         numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id,        numericality: { other_than: 1, message: "can't be blank" }
  validates :area_id,             numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_days_id,    numericality: { other_than: 1, message: "can't be blank" }
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :charge
  belongs_to :condition
  belongs_to :delivery_days

  validates :price, numericality: { only_integer: true }
end
