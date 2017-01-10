class PagesController < ApplicationController
	before_action :authenticate_employee!, except: [:home, :status]
  def home
  end

  def status
  end

  def livemap
	@customers = Client.all
	@hash = Gmaps4rails.build_markers(@customers) do |customer, marker|
		marker.lat customer.latitude
		marker.lng customer.longitude
		marker.title customer.name
	end
  end
end
