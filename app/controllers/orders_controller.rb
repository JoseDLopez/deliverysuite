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
    @clients = Client.all
    @zones = Zone.all
  end

  def show
  end

  def edit
  end

  def update
    @order = Order.find(params[:id])
  end

  def checknumber
    number = params[:phone]
    client = Client.where("phone = ?", number)
    # @client = Client.search(params[:phone])
    respond_to do |format|
       format.json {render :json => {client_exist: client.present?, client: client}}
    end
  end

# def check_user
#   user = params[:fieldValue]
#   user = User.where("username = ?", username).first
#   if user.present?
#     render :json =>  ["free-user", false , "This User is already taken"]
#   else
#     render :json =>  ["free-user", true , ""]
#   end
# end


   private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:name, :description)
    end 
end
