class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :area_id, :municipality, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :area_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A0\d{9,10}\z/, message: 'is invalid.' }
    validates :building_name
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :token
  end

  def save
    purchase_history = PurchaseHistory.create(item_id: item_id, user_id: user_id)

    ShippingAddress.create(post_code: post_code, area_id: area_id, municipality: municipality, address: address,
                           building_name: building_name, purchase_history_id: purchase_history.id, phone_number: phone_number)
  end
end
