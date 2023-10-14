class PurchaseDelivery
  include ActiveModel::Model
  attr_accessor  :card_number, :card_exp, :card_cvc, :user_id, :item_id, :zip_cord,
   :prefecture_id, :city, :house_number, :building_name, :phone_number, :token

  with_options presence: true do
    # validates :image
    # validates :item_name
    # validates :price,   numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999_999, message: 'is invalid' }
    # validates :cost_id,   numericality: { other_than: 1, message: "can't be blank" }
    validates :card_number
    validates :card_exp
    validates :card_cvc
    validates :user_id
    validates :item_id, numericality: { only_integer: true, greater_than_or_equal_to: 1, message: 'is invalid' }
    validates :token
  end
  with_options presence: true do
    validates :zip_cord, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid' }
    validates :prefecture_id,   numericality: { other_than: 1, message: "can't be blank" }
    validates :city      
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }
  end

  def save
    @item = PurchaseRecord.new(user_id: user_id, item_id: item_id)
    DeliveryDestination.new(zip_cord: zip_cord, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name,
       phone_number: phone_number, purchase_record_id: purchase_record_id)
  end

end
