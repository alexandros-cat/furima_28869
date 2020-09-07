class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :update]

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

  def authenticate_user!
    redirect_to action: :index unless user_signed_in?
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :category_id,
                                 :condition_id, :origin_id,
                                 :delivery_days_id, :shipping_charge_id, :image, :item_text).merge(user_id: current_user.id)
  end
end
