class ProductsController < ApplicationController
  before_action :set_produt, only: [:show, :create, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
     @reviews = @product.reviews
     @review = @reviews.new
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to product_url @product
  end

  def edit
    #↓これが気になる。エラー？
    @categories = Category.all
  end

  def update
    @product.update(product_params)
    redirect_to product_url @product
  end

  def destroy
    @product.destroy
    redirect_to products_url
  end

  private

  def set_produt
    @product = Product.find(params[:id])
  end
  
  def product_params
    params.require(:product).permit(:name, :description, :price, :category_id)
  end
end
