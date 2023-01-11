class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find, only: [:index, :create]

#   before_action :@item = Item.find(params[:item_id]), only: [:index, :create]
#   before_action :redirect_to root_path    if @item.user_id != current_user.id || @item.purchase_history.nil?
# end
  before_action :prevent_url, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
    # @item = Item.find(params[:item_id])
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_history_params)
    # @item = Item.find(params[:item_id])
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_history_params
    params.require(:purchase_address).permit(:post_code, :area_id, :municipality, :address, :building_name, :purchase_history_id, :phone_number).merge(
      user_id: current_user.id, token: params[:token], item_id: params[:item_id]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: purchase_history_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def prevent_url
    if @item.user_id == current_user.id || @item.purchase_history != nil
  
      # <% if user_signed_in? %> （学習用で記録を残します）
      #   <% unless @item.purchase_history.present? %>

      redirect_to root_path
    end    
  end

   def item_find
    @item = Item.find(params[:item_id])
   end
end


# <% if user_signed_in? %> （学習用で記録を残します）
#   <% unless @item.purchase_history.present? %>