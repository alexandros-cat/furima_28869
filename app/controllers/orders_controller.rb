class OrdersController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
    @shippingaddress = Shippingaddress.new

  end
  
  

  def create
     @shippingaddress = Shippingaddress.new(orders_params)
   if@Shippingaddress.valid?
     pay_item
     @Shippingaddresses.save(orders_params)
     return redirect_to root_path
   else
     render 'index'
   end  
  end

  private

  def orders_params
    params.
    permit(:origin_id, :price,:postal_code, :city, :address_line,
           :address_build,:phone_number, :token)
           .merge(user_id: current_user.id, item_id: params[:item_id],
            buyer_id: params[:buyer_id])  
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
 end