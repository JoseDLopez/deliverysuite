class ProductsController < ApplicationController
	before_action :authenticate_employee!, except: [:home, :status]
  def index
  end

  def show
  end

  def create
	category_ids = product_params["category_ids"].delete_if{ |x| x.empty? }
	@categories = Category.find(category_ids)
  	@product = Product.new(product_params)
  	# @product.categories << @categories
  	if @product.save
  		redirect_to products_path
  	end
  end

  def new
  	@product = Product.new
  	@categories = Category.all
  end

  def product_params
  	params.require(:product).permit(:name,:description,:time,:price,:picture,:category_ids => [])
  end



end
