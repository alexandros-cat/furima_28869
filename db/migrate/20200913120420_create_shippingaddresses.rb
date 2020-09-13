class CreateShippingaddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shippingaddresses do |t|
      t.integer :buyer_id ,null: false, foreign_key: true
      t.integer :origin_id ,null: false
      t.string  :postal_code  ,null: false
      t.string  :city  ,null: false
      t.string  :address_line ,null: false
      t.string  :address_build ,null: false
      t.string  :phone_number ,null: false
      t.timestamps
    end
  end

end
