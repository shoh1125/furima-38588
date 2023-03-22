class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]
  before_action :find_item, only: [:index, :new, :create]
  before_action :move_to_root_path, only: [:index, :create]

  
  def index
    @purchase_record_address = PurchaseRecordAddress.new
  end
  

  def create
    @purchase_record_address = PurchaseRecordAddress.new(purchase_record_params)

   if  @purchase_record_address.valid?
       pay_item
       @purchase_record_address.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def find_item
    @item = Item.find(params[:item_id])
  end
  
  def purchase_record_params
    params.require(:purchase_record_address).permit(:post_code, :prefecture_id, :municipality, :address, :building_name, :tel_number).merge(user_id: current_user.id,item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_record_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_root_path
    if @item.user_id == current_user.id || @item.purchase_record != nil
      redirect_to root_path
    end
  end
  

end


