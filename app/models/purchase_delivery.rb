class PurchaseDelivery
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zip_cord, :prefecture_id, :city, :house_number, :building_name, :phone_number, :token,
                :purchase_record_id

  with_options presence: true do
    validates :user_id
    validates :item_id, numericality: { only_integer: true, greater_than_or_equal_to: 1, message: 'is invalid' }
    validates :token
    validates :zip_cord, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }
  end

  def save
    @item = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    delivery_destination_data = { zip_cord: zip_cord, prefecture_id: prefecture_id, city: city, house_number: house_number,
                                  building_name: building_name, phone_number: phone_number, purchase_record_id: @item.id }
    DeliveryDestination.create(delivery_destination_data)
  end
end
