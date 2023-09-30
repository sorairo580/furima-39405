class ItemsController < ApplicationController
  before_action :move_to_sessions_new, except: [:index, :show]
  before_action :move_to_edit, except: [:index, :show]

  def index
    @items = Item.order('created_at DESC')
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :price, :item_description, :category_id, :condition_id, :cost_id,
                                 :delivery_day_id, :prefecture_id).merge(user_id: current_user.id)
  end

  def move_to_sessions_new
    return if user_signed_in?
    redirect_to new_user_session_path
  end

  def move_to_edit
    @item = Item.find(params[:id])
    return if user_signed_in? && current_user.id == @item.user_id
    redirect_to root_path
  end

end
