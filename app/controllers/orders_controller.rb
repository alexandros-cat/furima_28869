class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item , only: [:index, :create]
  before_action :buyer_index, only:[:index]
  before_action :move_to_index,only:[:index]

  def index

  end

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

  def move_to_index
   if @item.user_id == current_user.id 
      redirect_to root_path
   end 
  end  
  def set_item                         
    @item = Item.find(params[:item_id])
  end

  def buyer_index
   if @item.buyer.present?
   redirect_to root_path
   end  
  end
end