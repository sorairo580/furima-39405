class PurchaseRecordsController < ApplicationController
 
  def index
    # if @item.exist?
    @order = Item.find(params[:item_id])
    # redirect_to item_purchase_record_index_path
    # end
  end

  def create
    @order = PurchaseRecord.new(purchase_record.params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render 'purchase_records/index'
    end
  end

  private

  def purchase_record.params
    params.require(:purchase_record).permit(:image, :item_name, :price, :cost_id).merge(user_id: current_user.id)
  end


end
