class PagesController < ApplicationController
	before_action :authenticate_employee!, except: [:home, :status]
  def home
  end

  def status
  end

  def livemap
	@customers = Client.all
	@zones = Zone.all
	@orders = Order.all
	@clientes = []

	@orders.each do |o|
		if o.payment == nil
			@clientes.push({"name" => o.client.name, "latitude" => o.client.latitude, "longitude" => o.client.longitude, "order" => o.id, "client" => o.client.id})
		end

	end


	# @hash = clientes.each do |customer, marker|
	# 	marker.lat customer["latitude"]
	# 	marker.lng customer["longitude"]
	# 	marker.title customer["name"]
	# 	marker.order customer["order"]
	# 	marker.client customer["client"]
	# end
  end
end
