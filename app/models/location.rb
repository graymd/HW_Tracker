class Location < ActiveRecord::Base
  def index
  end

  def new
    @location = Location.new
  end
end
