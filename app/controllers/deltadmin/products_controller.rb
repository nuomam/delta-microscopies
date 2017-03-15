class Deltadmin::ProductsController < Deltadmin::ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]


  def index
    @products = Product.all.order(name: 'ASC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = product.new(product_params)

    if @product.save
      redirect_to deltadmin_product_path(@product)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to deltadmin_product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    # no need for app/views/restaurants/destroy.html.erb
    redirect_to deltadmin_products_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :active, :supplier_ref, :delta_ref, :sell_price, :buy_price, :product_number, :supplier_id, :sub_category_id, :photo)
  end

end
