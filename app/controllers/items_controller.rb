class ItemsController < ApplicationController
  before_action :move_to_sessions_new, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_to_edit, except: [:index, :show, :new, :create]

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
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
    return if current_user.id == @item.user_id
    redirect_to root_path
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
