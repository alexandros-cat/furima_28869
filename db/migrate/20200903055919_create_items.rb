class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,            null: false
      t.string :user_id,         null: false, default: ""
      t.string :price ,          null: false, default: ""
      t.string :category ,       null: false, default: ""
      t.string :condition,       null: false, default: ""
      t.string :origin ,         null: false, default: ""
      t.string :delivery_days ,  null: false, default: ""
      t.string :shipping_charge, null: false, default: ""
      t.timestamps
    end
  end
end

