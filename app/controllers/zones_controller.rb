class ZonesController < ApplicationController
	before_action :authenticate_employee!, except: [:home, :status]
  def index
  end

  def show
  end
end
