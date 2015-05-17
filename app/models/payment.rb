class Payment < ActiveRecord::Base
  belongs_to :order

  mount_uploader :receipt_image, PaymentReceiptImageUploader

  validates_presence_of :amount
  validates_presence_of :account_number
  validates_presence_of :payment_date

  STATUS = {
      :pending => 'Pending',
      :verification => 'Waiting for verification',
      :canceled => 'Canceled',
      :confirmed => 'Confirmed'
  }


  PAYMENT_TYPE = {
       'Bikash' => :bikash,
       'Brack Bank' => :brack_bank,
       'Dutch Bangla Bank' => :dutch_bangla_bank
  }

  def order_total_price
    price * quantity
  end
end
