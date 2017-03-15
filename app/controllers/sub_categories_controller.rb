class SubCategoriesController < ApplicationController
  before_action :set_subcategory , only: [:show]

  def index
    @sub_categories = SubCategory.all.order(name: 'ASC')
  end

  def show
    @products = @sub_category.products
  end

  private

  def set_subcategory
    @sub_category = SubCategory.find(params[:id])
  end
end
