class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :ensure_correct_user, only: [:edit, :update]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  
  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def ensure_correct_user
    @item = Item.find(params[:id])
    unless user_signed_in? && @item.user.id == current_user.id
      redirect_to root_path
    end
  end

  def item_params
    params.require(:item).permit(:image, :name, :price, :explanation, :category_id, :status_id, :shipping_cost_id,
                                 :prefecture_id, :shipping_date_id).merge(user_id: current_user.id)
  end
end
