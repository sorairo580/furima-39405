class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item

  def index
    return redirect_to root_path unless user_signed_in? && current_user.id != @item.user_id && !@item.purchase_record.present?

    @purchase_delivery = PurchaseDelivery.new
  end

  def create
    @purchase_delivery = PurchaseDelivery.new(purchase_record_params)
    if @purchase_delivery.valid?
      pay_item
      @purchase_delivery.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_record_params
    params.require(:purchase_delivery).permit(:image, :item_name, :price, :cost_id, :zip_cord, :prefecture_id, :city,
                                              :house_number, :building_name, :phone_number, :card_number, :card_exp, :card_cvc).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: purchase_record_params[:token],
      currency: 'jpy'
    )
  end
end
