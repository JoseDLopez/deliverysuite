class PagesController < ApplicationController
	before_action :authenticate_employee!, except: [:home, :status]
  def home
  end

  def status
  end

  def livemap
  end
end
