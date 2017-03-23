class SubCategoriesController < ApplicationController
  before_action :set_subcategory , only: [:show]
  skip_before_action :authenticate_user!, only: [ :index, :show ]


  def index
    @sub_categories = SubCategory.all.order(name: 'ASC')
  end

  def show
    @products = @sub_category.products.where(active: true).order(name: 'ASC')
  end

  private

  def set_subcategory
    @sub_category = SubCategory.find(params[:id])
  end
end
