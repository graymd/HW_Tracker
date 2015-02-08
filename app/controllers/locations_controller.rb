class LocationsController < ApplicationController
  def index
  end

  def new
    @location = Location.new
  end
end
