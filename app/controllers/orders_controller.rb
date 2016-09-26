class OrdersController < ApplicationController

  def create
    @unsub = Unsub.find(params[:unsub_id])
    order  = Order.create!(unsub_sku: @unsub.sku, amount: @unsub.price, state: 'pending')

    redirect_to new_order_payment_path(order)
  end

end
