class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

   def show
     @items = Item.find(params[:id])
   end

   def edit
     @item = Item.find(params[:id])
     unless @item.user_id == current_user.id
      redirect_to root_path
    end
   end

   def update
     @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end

   end



  #  def destroy
  #    item = Item.find(params[:id])
  #  end




  private

  def item_params
    params.require(:item).permit(:name, :explanation, :price, :category_id, :condition_id, :delivery_charge_id, :prefecture_id,
                                 :delivery_date_id, :image).merge(user_id: current_user.id)
  end
end
