class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string   :name,            null: false
      t.integer  :user_id,         null: false
      t.integer  :price ,          null: false
      t.integer  :category ,       null: false
      t.integer  :condition,       null: false
      t.integer  :origin ,         null: false
      t.integer  :delivery_days ,  null: false
      t.integer  :shipping_charge, null: false
      t.timestamps
    end
  end
end

