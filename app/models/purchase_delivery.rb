class PurchaseDelivery
  include ActiveModel::Model
  attr_accessor :image, :item_name, :price, :cost_id, :card_number, :card_expiry_month, :card_expiry_year, :card_cvc, :user_id, :item_id, :zip_cord,
   :prefecture_id, :city, :house_number, :building_name, :phone_number

  with_options presence: true do
    validates :image
    validates :item_name
    validates :price,   numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999_999, message: 'is invalid' }
    validates :cost_id,   numericality: { other_than: 1, message: "can't be blank" }
    validates :card_number
    validates :card_expiry_month
    validates :card_expiry_year
    validates :card_cvc
    validates :user_id
    validates :item_id
  end
  with_options presence: true do
    validates :zip_cord,   format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id,   numericality: { other_than: 1, message: "can't be blank" }
    validates :city     
    validates :house_number    
    validates :building_name
    validates :phone_number
  end

  def save
    @item = PurchaseRecord.new(image: image, item_name: item_name, price: price, cost_id: cost_id, user_id: user_id, item_id: item_id)
    DeliveryDestination.new(zip_cord: zip_cord, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name,
       phone_number: phone_number, purchase_record_id: purchase_record_id)
  end

end