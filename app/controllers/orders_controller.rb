class OrdersController < ApplicationController
  def index
    @orders = @current_user.orders
    render plain: "Order Placed!"
  end

  def create
    order = Order.create!({
      user_id: @current_user.id,
      total_price: @cart.total_price,
    })
    @cart.cart_items.each do |item|
      OrderItem.create!({
        order_id: order.id,
        menu_item_id: item.menu_item_id,
        menu_item_name: item.menu_item_name,
        menu_item_price: item.menu_item_price,
        quantity: item.quantity,
      })
    end

    @cart.cart_items.destroy_all

    redirect_to order_path(order.id)
  end

  def show
    @order = Order.find_by(id: params[:id], user_id: @current_user.id)
    render plain: ""
  end
end
