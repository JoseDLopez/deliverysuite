class ClientsController < ApplicationController
	before_action :authenticate_employee!, except: [:home, :status]
	before_action :set_client, only: [:show, :edit, :update]
  def index
  end

  def show
  end

  def create
 	@client = Client.new(client_params)
      respond_to do |format|
      if @client.save
        format.js
      else
        format.js
      end
    end
  end

  def new
  end


   private
    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:name, :lastname, :phone, :rut, :address, :remark, :email)
    end 
end
