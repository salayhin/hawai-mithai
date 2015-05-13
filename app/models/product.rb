class Product < ActiveRecord::Base
  belongs_to :category
  has_many :orders

  mount_uploader :image, ProductImageUploader

  scope :published_products, -> { where(is_published: true) }
end
