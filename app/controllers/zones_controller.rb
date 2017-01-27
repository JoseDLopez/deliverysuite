class ZonesController < ApplicationController
	before_action :authenticate_employee!, except: [:home, :status]
	before_action :set_zone, only: [:show, :edit, :update, :destroy]
	def index
		@zones = Zone.all
		@customers = Client.all
		@orders = Order.all
		@hash = Gmaps4rails.build_markers(@customers) do |customer, marker|
			marker.lat customer.latitude
			marker.lng customer.longitude
			marker.title customer.name
		end
	end

	def show
		@orders = @zone.orders
	end

	def edit
	end

	def create
	end

	def new
	end

	def update
	end

	def destroy
	end






	private
		def set_zone
		@zone = Zone.find(params[:id])
		end

		def zone_params
		params.require(:category).permit(:name, :description, :price, :dots)
		end
end
