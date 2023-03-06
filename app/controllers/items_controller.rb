class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    if user_signed_in?
    else
      redirect_to  new_user_session_path
    end

  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end  
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :price, :category_id, :condition_id, :delivery_charge_id, :prefecture_id, :delivery_date_id, :image).merge(user_id: current_user.id)
  end

end
