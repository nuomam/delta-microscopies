class Deltadmin::CategoriesController < Deltadmin::ApplicationController
  before_action :set_category , only: [:show, :edit, :update, :destroy]


  def index
    @categories = Category.all.order(name: 'ASC')
    @sub_categories = SubCategory.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to deltadmin_categories_path
    else
      render :new
    end
  end

  def show

  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to deltadmin_categories_path
    else
      render :edit
    end
  end

  def delete
    @category = Category.find(params[:id])
    raise
    @category.destroy
    # no need for app/views/restaurants/destroy.html.erb
    redirect_to deltadmin_categories_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
