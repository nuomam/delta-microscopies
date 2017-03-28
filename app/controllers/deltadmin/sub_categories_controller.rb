class Deltadmin::SubCategoriesController < Deltadmin::ApplicationController
  before_action :set_subcategory , only: [:show, :edit, :update, :destroy]


  def index
    @sub_categories = SubCategory.all.order(name: 'ASC')
  end

  def new
    @sub_category = SubCategory.new
  end

  def create
    @sub_category = SubCategory.new(sub_category_params)

    if @sub_category.save
      redirect_to deltadmin_sub_category_path(@sub_category)
    else
      render :new
    end
  end

  def show

  end

  def edit
  end

  def update
    if @sub_category.update(sub_category_params)
      redirect_to deltadmin_sub_category_path(@sub_category)
    else
      render :edit
    end
  end

  def destroy
    @sub_category.destroy
    # no need for app/views/restaurants/destroy.html.erb
    redirect_to deltadmin_categories_path
  end

  private

  def set_subcategory
    @sub_category = SubCategory.find(params[:id])
  end

  def sub_category_params
    params.require(:sub_category).permit(:name, :category_id, :photo)
  end

end
