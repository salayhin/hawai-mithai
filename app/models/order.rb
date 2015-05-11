class Order < ActiveRecord::Base
  has_many :payments
end
