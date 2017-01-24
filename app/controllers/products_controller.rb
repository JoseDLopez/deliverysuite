class ProductsController < ApplicationController
	before_action :authenticate_employee!, except: [:home, :status]
  def index
  end

  def show
  end

  def create
  	@product = Product.new(product_params)
  	if @product.save
  		redirect_to products_path
  	end
  end

  def new
  	@product = Product.new
  end

  def product_params
  	params.require(:product).permit(:name,:description,:time,:price)
  end



end
