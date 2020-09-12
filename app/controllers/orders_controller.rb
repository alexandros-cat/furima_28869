class OrdersController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
  end
  
  def new
    @shippingaddresses = Shippingaddress.new(orders_params)
  end

  def create
     @shippingaddresses = Shippingaddress.new(orders_params)
   if@Shippingaddresses.save(orders_params)
    redirect_to "/items/:item_id/orders"
   else
     render 'index'
   end  
  end

  private

  def orders_params
    params.
    permit(:origin_id, :price,:postal_code, :city, :address_line,
           :address_build,:phone_number )
           .merge(user_id: current_user.id, item_id: params[:item_id],
            buyer_id: params[:buyer_id])  
  end
 end