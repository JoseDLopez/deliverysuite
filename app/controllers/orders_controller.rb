class OrdersController < ApplicationController
	before_action :authenticate_employee!, except: [:home, :status]
	before_action :set_order, only: [:show, :edit, :update]

  def index
  	@orders = Order.all.order(created_at: :desc)
  end

  def create
    order = Order.new
    zone = Zone.find(params[:zonaid])
    number = params[:phone]
    client = Client.find_by_phone(number)
    total = zone.price.to_i
    order[:zone_id] = zone.id
    order[:client_id] = client.id
    productos = JSON.parse(params[:products])
    sumaprecioproductos = 0
    productos.each do |p|
      itera = p["qty"]
      toadd = Product.find(p["id"])
      while itera > 0  do
        order.products << toadd
        sumaprecioproductos += toadd.price.to_i

         itera -= 1  
      end
    end

    total += sumaprecioproductos
    order[:total] = total


    if order.save
      redirect_to client_order_path(client,order), notice: 'Orden creada correctamente'
    end

  end

  def new
    @order = Order.new
    @categories = Category.all
    @products = Product.all
    @clients = Client.all
    @zones = Zone.all
    @client = Client.new
  end

  def show
    @order = Order.find(params[:id])
    @client = @order.client
    @totalproductos = 0
    @productosdeorden = @order.products.order(:name)
    @productosdeorden.each do |p|
      precio = p.price
      if p.price == nil
        precio = 0
      end
      @totalproductos += precio
    end
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

  def get_category_products
    cat = params[:category]
    if cat == "all"
      productoscat = Product.all.order(:name)
      respond_to do |format|
         format.json {render :json => {product_exist: productoscat.present?, category_products: productoscat}}
      end
    else
      category = Category.find(cat)
      productoscat = category.products.order(:name)
      respond_to do |format|
         format.json {render :json => {product_exist: productoscat.present?, category_products: productoscat}}
      end
    end

  end


  def get_orders_by_status
    stat = params[:status]
    if stat == "all"

      ordersstat = Order.all.order(created_at: :desc)
      respond_to do |format|
         format.json {render :json => {order_exist: ordersstat.present?, orders_status: ordersstat}}
      end

    elsif stat == "new"

      ordenes = Order.all.order(created_at: :desc)
      ordenestoshow = []
      ordenes.each do |o|
        if o.payment == nil
          ordenestoshow.push(o)
        end
      end

      respond_to do |format|
         format.json {render :json => {order_exist: ordenestoshow.present?, orders_status: ordenestoshow}}
      end

    elsif stat == "paid"
      ordenes = Order.all.order(created_at: :desc)
      ordenestoshow = []
      ordenes.each do |o|
        if o.payment != nil
          ordenestoshow.push(o)
        end
      end
      
      respond_to do |format|
         format.json {render :json => {order_exist: ordenestoshow.present?, orders_status: ordenestoshow}}
      end

    end

  end



   private
    def set_order
      @order = Order.find(params[:id])
    end
end
