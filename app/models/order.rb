class Order < ActiveRecord::Base
  has_many :payments
  belongs_to :product

  STATUS = {
      :new => 'New',
      :pending => 'Pending',
      :shipped => 'Shipped',
      :canceled => 'Canceled',
      :confirmed => 'Confirmed'
  }

  ####<$ Scope List $>####
  scope :user_order_list, ->(user_id) { where('user_id =?', user_id)}

  def self.find_with_product(product)
    return [] unless product
        where(["product_id = ?", product.id]).
        order("created_at DESC")
  end

  def order_total
    self.payments.to_a.sum { |item| item.order_total_price }
  end
end
