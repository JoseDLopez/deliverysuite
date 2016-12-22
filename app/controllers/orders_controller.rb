class OrdersController < ApplicationController
	before_action :authenticate_employee!, except: [:home, :status]
  def index
  end

  def create
  end

  def show
  end
end
