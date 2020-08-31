class ItemsController < ApplicationController
  before_action :authenticate_user!, :except=>[:index, :update]

  def index
    @users = User.all
  end  

  def authenticate_user!
    unless user_signed_in?
      redirect_to action: :index
    end
  end 
end
