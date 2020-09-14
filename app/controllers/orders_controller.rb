class OrdersController < ApplicationController
 
  before_action :set_item , only: [:index, :create]
  
  def create
   
    @shippingaddress = UserFurima.new(orders_params) 
   if @shippingaddress.valid?
      pay_item
      @shippingaddress.save
      redirect_to root_path
   else
     render 'index'
   end  
  end

  private

  def orders_params
    params.
    permit(:origin_id,:postal_code, :city, :address_line,:token,:item_id,
           :address_build,:phone_number)
           .merge(user_id: current_user.id)  
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: orders_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def set_item                         
    @item = Item.find(params[:item_id])
  end
 end