class UserFurima

  include ActiveModel::Model
  attr_accessor :origin_id, :postal_code, 
                :city, :address_line, :phone_number,:token ,:address_build,
                :user_id,:item_id 
              
 
  with_options presence: true do
   validates :origin_id 
   validates :postal_code
   validates :city 
   validates :address_line
   validates :phone_number
   validates :token
  end  
  validates :postal_code, format:{ with: /\A\d{3}[-]\d{4}\z/ } 
  validates :phone_number, format:{ with: /\A\d{11}\z/} 

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Shippingaddress.create(origin_id: origin_id,postal_code:postal_code,
                           city:city,address_line:address_line, address_build:address_build,
                           phone_number:phone_number ,token:token,buyer_id:buyer.id)
  end
end  