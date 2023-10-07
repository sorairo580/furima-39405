class PurchaseRecordsController < ApplicationController
 
  def index
    # if @item.exist?
    @item = Item.find(params[:item_id])
    # redirect_to item_purchase_record_index_path
    # end
  end

   # def create
  #   @purchase_record = Item.new(item_params[:id])
  #   @purchase_record = User.new(item_params[:id])
  #   if @purchase_record.save
  #     redirect_to item_purchase_records_path
  #   # else
  #   #   render 
  #   end
  # end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :price, :item_description, :category_id, :condition_id, :cost_id,
                                 :delivery_day_id, :prefecture_id).merge(user_id: current_user.id)
  end


end
