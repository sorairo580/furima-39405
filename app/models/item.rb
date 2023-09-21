class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase_record
  has_one_attached :image

  validates :item_name,        presence: true
  validates :price,            presence: true, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999999 }
  validates :item_description, presence: true
  validates :category_id,      numericality: { other_than: 1 , message: "can't be blank" }
  validates :contition_id,     numericality: { other_than: 1 , message: "can't be blank" }
  validates :cost_id,          numericality: { other_than: 1 , message: "can't be blank" }
  validates :delivery_day_id,  numericality: { other_than: 1 , message: "can't be blank" }
  validates :prefecture_id,    numericality: { other_than: 1 , message: "can't be blank" }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :contition
  belongs_to :cost
  belongs_to :delivery_day
  belongs_to :prefecture

end
