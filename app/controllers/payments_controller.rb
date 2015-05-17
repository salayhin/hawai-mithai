class PaymentsController < ApplicationController
  def create
    @payment = Payment.new(payment_params)
    @payment.status = Payment::STATUS[:verification]
    if @payment.save
      redirect_to pay_path(:order_no => @payment.order.id), :notice => 'Payment info updated, we will verify soon!'
    else
      flash.now[:error] = 'There is a problem to save this payment info! Please tray again.'
      add_error_messages(@payment)
      redirect_to pay_path(:order_no => @payment.order.id)
    end
  end

  def receipt_image
    @payment = Payment.find_by_id(params[:payment])

    unless @payment
      redirect_to root_path, :notice => 'No valid payment found'
    end
  end

  private
  def payment_params
    params.require(:payment).permit(:order_id, :payment_type, :amount,:account_number,
                                  :payment_date, :receipt_image, :status)
  end
end
