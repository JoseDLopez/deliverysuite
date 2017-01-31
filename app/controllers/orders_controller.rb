class OrdersController < ApplicationController
	before_action :authenticate_employee!, except: [:home, :status]
	before_action :set_order, only: [:show, :edit, :update]

  def index
  	@orders = Order.all
  end

  def create
    @order = Order.new(order_params)
  end

  def new
    @order = Order.new
    @categories = Category.all
    @products = Product.all
  end

  def show
  end

  def edit
  end

  def update
    @order = Order.find(params[:id])
  end



   private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:name, :description)
    end 
end
