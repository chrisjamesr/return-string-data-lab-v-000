class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def create
    product = Product.new(product_params)
    if product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def index
    @products = Product.distinct
  end

  def show
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def inventory
    product = Product.find(params[:id])
    render plain: product.inventory > 0 ? true : false
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :inventory)
  end
end
