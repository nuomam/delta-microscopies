class ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  def index
    @products = Product.all.order(name: 'ASC')
  end

  def show
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end
