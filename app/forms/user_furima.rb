class UserFurima

  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :buyer_id, :origin_id, :postal_code, :city, :address_line, :address_build, :phone_number
 
  with_options presence: true do
   validates :buyer_id 
   validates :origin_id 
   validates :postal_code
   validates :city 
   validates :address_line
   validates :address_build
   validates :phone_number
   validates :token, presence: true
 end  
  validates :postal_code, format:{ with: /\A\d{3}[-]\d{4}\z/ } 
  validates :phone_number, format:{ with: /\A\d{11}\z/} 

  def save
    Buyer.create(user_id: user_id, item_id: item_id)
    Shippingaddress.create(buyer_id:buyer_id, origin_id: origin_id,postal_code:postal_code
                          ,city:city,address_line:address_line, address_build:address_build
                          ,phone_number:phone_number ,item_id:item.id)
  end
end  