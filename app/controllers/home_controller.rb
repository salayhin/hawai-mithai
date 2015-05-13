class HomeController < ApplicationController
  def index
    @products = Product.published_products
  end
end
