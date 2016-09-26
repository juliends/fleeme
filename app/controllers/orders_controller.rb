class OrdersController < ApplicationController

  def create
    @unsub = Unsub.find(params[:unsub_id])
    order  = Order.create!(teddy_sku: @teddy.sku, amount: @teddy.price, state: 'pending')

    redirect_to new_order_payment_path(order)
  end

end
