class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:edit, :update, :show]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
    redirect_to root_path
    else
      render 'new'
    end  
  end



  def update
    if@item.update(item_params)
      redirect_to item_path
    else
       render 'edit'
    end 
  end  

  

  private

  def item_params
    params.require(:item).permit(:name, :price, :category_id,
                                 :condition_id, :origin_id,
                                 :delivery_days_id, :shipping_charge_id, :image, :item_text).merge(user_id: current_user.id)
  end

  def set_item                         
    @item = Item.find(params[:id]) 
  end
end
