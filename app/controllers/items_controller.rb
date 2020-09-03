class ItemsController < ApplicationController
  before_action :authenticate_user!, :except=>[:index, :update]

  def index
    @items = Item.all
  end    

  def new
   @items = Item.all
  end  
  
  def create
   @items = Item.new(items_params)
  end  

  def authenticate_user!
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  
  private
  def items_params
    params.require(:item).permit(:name, :price, :category, 
                                 :condition,:origin, 
                                 :delivery_days, :shipping_charge)
  end  
end
