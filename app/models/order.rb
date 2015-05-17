class Order < ActiveRecord::Base
  has_many :payments
  belongs_to :product

  validates_presence_of :full_name
  validates_presence_of :address
  validates_presence_of :delivery_address
  validates_presence_of :mobile
  validates_presence_of :quantity

  STATUS = {
      :new => 'New',
      :pending => 'Pending',
      :shipped => 'Shipped',
      :canceled => 'Canceled',
      :confirmed => 'Confirmed'
  }

  QUANTITY = {
      '10 Kg' => 10,
      '15 Kg' => 15,
      '20 Kg' => 20,
      '25 Kg' => 25,
      '30 Kg' => 30,
      '35 Kg' => 35,
      '40 Kg' => 40,
      'Above' => 500
  }

  LARGE_QUANTITY = 500

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
