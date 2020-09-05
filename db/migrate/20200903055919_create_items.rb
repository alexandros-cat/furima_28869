class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string   :name,            null: false
      t.string   :item_text,      null: false
      t.integer  :user_id,         null: false, foreign_key: true
      t.integer  :price ,          null: false
      t.integer  :category_id ,       null: false
      t.integer  :condition_id,       null: false
      t.integer  :origin_id ,         null: false
      t.integer  :delivery_days_id ,  null: false
      t.integer  :shipping_charge_id, null: false
      t.timestamps
    end
  end
end

