class LocationsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.create location_params
    if @location.save
      flash[:notice] = "Location successfully saved."
      redirect_to locations_path
    else 
      flash[:alert] = "Location NOT successfully saved."
      render :new
    end
  end

  def show
    @location = Location.find params[:id]
  end

  def edit
    @location = Location.find params[:id]
  end

  def update
    @location = Location.find params[:id]
    if @location.update location_params
      flash[:notice] = "Location was successfully updated."
      redirect_to location_path(@location)
    else
      flash[:alert] = "Location was NOT successfully updated."
      render :edit
    end
  end

  def destroy
    @location = Location.find params[:id]
    if @location.destroy
      flash[:notice] = "#{@location.city} was successfully deleted."
      redirect_to locations_path
    else
      flash[:alert] = "#{@location.city} was NOT successfully deleted."
      render :show
    end
  end

private
  def location_params
    params.require(:location).permit(
      :street_address,
      :city,
      :state,
      :zip_code,
      :open_date
    )
  end
end
