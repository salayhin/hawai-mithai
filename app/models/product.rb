class Product < ActiveRecord::Base
  belongs_to :category
  has_many :orders

  mount_uploader :image, ProductImageUploader
end
