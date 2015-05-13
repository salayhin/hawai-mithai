class Payment < ActiveRecord::Base
  belongs_to :order

  def order_total_price
    price * quantity
  end
end
