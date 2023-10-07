class DeliveryDestination < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :zip_cord, :prefecture_id, :city, :house_number, :building_name, :phone_number

  validates :zip_cord,        presence: true
  validates :prefecture_id,   presence: true
  validates :city,            presence: true
  validates :house_number,    presence: true
  validates :building_name,   presence: true
  validates :phone_number,    presence: true

  def save
  end

  belongs_to :purchase_record
  
end
