class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string    :item_name,         null: false, default: ""
      t.integer   :category_id,       null: false
      t.integer   :price,             null: false
      t.text      :item_description,  null: false
      t.integer   :condition_id,      null: false
      t.integer   :cost_id,           null: false
      t.integer   :prefecture_id,     null: false
      t.integer   :delivery_day_id,   null: false
      t.timestamps
    end
  end
end
