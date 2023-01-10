class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_furima, only: [:edit, :show, :update, :destroy]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to user_session_path(@item.id)
    end
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    redirect_to root_path    if @item.user_id != current_user.id || @item.purchase_history.present?
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      # updateを失敗すると編集ページへ
      render 'edit'
    end
  end

  def destroy
    if @item.user != current_user
      redirect_to root_path
    else
      @item.destroy
      redirect_to root_path
    end
  end

  private

  def set_furima
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:product_name, :description, :category_id, :condition_id, :charge_id, :area_id, :delivery_days_id,
                                 :price, :image).merge(user_id: current_user.id)
  end
end
