class PurchaseRecord < ApplicationRecord
  has_one    :delivery_destination
  belongs_to :item
  belongs_to :user
  # has_one_attached :image
end
