class CreateDeliveryDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_destinations do |t|
      t.string     :zip_cord,        null: false
      t.integer    :prefecture_id,   null: false
      t.string     :city,            null: false
      t.string     :house_number,    null: false
      t.string     :building_name 
      t.string     :phone_number,    null: false
      t.references :purchase_record, null: false, foreign_key: true
      t.timestamps
    end
  end
end
