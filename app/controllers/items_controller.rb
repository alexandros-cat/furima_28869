class ItemsController < ApplicationController
  before_action :authenticate_user!, :except=>[:index, :update]

  def index
    @users = User.all
  end  

  def edit
  end

  def update
    if current_user.update(user_params)
       redirect_to root_path
    else
       render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end 

  def authenticate_user!
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
