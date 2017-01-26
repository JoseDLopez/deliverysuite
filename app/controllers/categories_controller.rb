class CategoriesController < ApplicationController
	before_action :authenticate_employee!, except: [:home, :status]
	before_action :set_category, only: [:show, :edit, :update, :destroy]
  def index
  	@categories = Category.all
  end

  def show
  	@products = @category.products
  end

  def create
  	@category = Category.new(category_params)
  	if @category.save
  		redirect_to categories_path, notice: 'Categoría creada correctamente'
  	end
  end

  def new
  	@category = Category.new
  end

  def edit
  end

  def update
  	@category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to category_path(@category), notice: 'Categoría actualizada correctamente'
    end
  end

  def destroy
    @category.products.delete_all
    @category.destroy
    redirect_to categories_path, notice: 'Categoría eliminada correctamente'
  end




  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :description)
    end

end
