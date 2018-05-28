class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :data, :inventory, :description]

  def index
    @products = Product.all
  end

  def show
  end 

  def new
    @product = Product.new
  end

  def inventory
    render plain: @product.inventory > 0 ? true : false
  end

  def description
    render plain: @product.description
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    @product.save
    redirect_to products_path
  end

  def data
    binding.pry
    render json: ProductSerializer.serialize(@product)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :inventory, :price)
  end
end
