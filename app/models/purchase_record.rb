class PurchaseRecord < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :image, :item_name, :price, :cost_id, 

  validates :image,            presence: true
  validates :item_name,        presence: true
  validates :price,            presence: true,numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999_999, message: 'is invalid' }
  validates :cost_id,          numericality: { other_than: 1, message: "can't be blank" }

  def save
    
  end 

  has_one    :delivery_destination
  belongs_to :item
  belongs_to :user
  has_one_attached :image

  
end
