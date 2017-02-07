class PaymentsController < ApplicationController
	before_action :authenticate_employee!, except: [:home, :status]
	before_action :set_payment, only: [:show]
  def index
    @payments = Payment.all.order(created_at: :desc)
  end

  def show
  end

  def create
  	@payment = Payment.new(order_id: params[:order_id])
  	@client = Client.find(params[:client_id])
  	@order = Order.find(params[:order_id])
  	 if @payment.save
  		redirect_to client_order_path(@client,@order), notice: 'Pago realizado correctamente'
  	end
  end

   private
    def set_payment
      @payment = Payment.find(params[:id])
    end
end
