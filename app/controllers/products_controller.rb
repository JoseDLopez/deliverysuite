class ProductsController < ApplicationController
	before_action :authenticate_employee!, except: [:home, :status]
  def index
  	@products = Product.all
  end

  def show
  	@product = Product.find(params[:id])
  end

  def create
	category_ids = product_params["category_ids"].delete_if{ |x| x.empty? }
	@categories = Category.find(category_ids)
  	@product = Product.new(product_params)
  	# @product.categories << @categories
  	if @product.save
  		redirect_to products_path, notice: 'Producto creado correctamente'
  	end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path(@product), notice: 'Producto actualizado correctamente'
    end
  end

  def new
  	@product = Product.new
  	@categories = Category.all
  end

  def destroy
    @product = Product.find(params[:id])
    @product.categories.delete_all
    @product.destroy
    redirect_to products_path, notice: 'Producto eliminado correctamente'
  end

  def remove_category
    @category = Category.find(params[:category_id])
    @product = Product.find(params[:product_id])
    @product.categories.delete(@category)
    if @product.save
      redirect_to category_path(@category), notice: 'Producto removido de la categoria correctamente'
    end
  end

  def product_params
  	params.require(:product).permit(:name,:description,:time,:price,:picture,:category_ids => [])
  end



end
