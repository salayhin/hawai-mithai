class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)
    @order.status = Order::STATUS[:new]
    if @order.save
      order_no = 'HMI-' + @order.id.to_s
      if @order.quantity < 50
        price = @order.product.price * @order.quantity
      else
        price = 0
      end
      @order.update_attributes( order_no: order_no.to_s, total: price)
      redirect_to pay_path(:order_no => @order.id), :notice => 'Order placed successfully!'
    else
      flash.now[:error] = 'There is a problem to save this order! Please tray again.'
      add_error_messages(@order)
      redirect_to product_path(params[:order][:product_id])
    end
  end

  def pay
    @order = Order.find_by_id(params[:order_no])

    unless @order
      redirect_to root_path, :notice => 'No order found'
    end

    @payment = Payment.new
  end

  def check_order_status
    @order = Order.find_by_order_no(params[:order_no])

    unless @order
      redirect_to root_path, :notice => 'No order found'
    end

    unless @order.payments.present?
      redirect_to pay_path(:order_no => @order.id), :notice => 'Please pay first!'
    end
  end

  private
  def order_params
    params.require(:order).permit(:full_name, :company, :address,:delivery_address,
                                  :phone, :mobile, :quantity, :product_id, :status, :total)
  end
end
