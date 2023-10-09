class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :find_item 

  def index
    # if @item.exist?
    @purchase_delivery = PurchaseDelivery.new
    # redirect_to item_purchase_record_index_path
    # end
  end

  def create
    @purchase_delivery = PurchaseDelivery.new(purchase_record_params)
      if @purchase_delivery.valid?
      @purchase_delivery.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_record_params
    params.require(:purchase_delivery).permit(:image, :item_name, :price, :cost_id, :zip_cord, :prefecture_id, :city, 
      :house_number, :building_name, :phone_number).merge(user_id: params[:user_id], item_id: params[:item_id])
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

end
