class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @order = Order.new
  end
end
