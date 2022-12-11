class ItemsController < ApplicationController
  def index
  end
end

private

def message_params
  params.require(:item).permit(:product_name, discrption_id, category_id, dondition_id, charge_id, area_id, delivery_id, price, :image).merge(user_id: current_user.id)
end
