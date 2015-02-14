class LocationsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource param_method: :location_params
  def index
    @locations = Location.all
  end

  def new
    @courses = Course.all
    @location = Location.new
  end

  def create
    @courses = Course.all
    @location = Location.create location_params
    if @location.save
      flash[:notice] = "#{@location.city} successfully saved."
      redirect_to locations_path
    else 
      flash[:alert] = "Location NOT successfully saved."
      render :new
    end
  end

  def show
    @location = Location.find params[:id]
    @courses = @location.courses.all
  end

  def edit
    @location = Location.find params[:id]
    @courses = Course.all
  end

  def update
    @location = Location.find params[:id]
    if @location.update location_params
      flash[:notice] = "#{@location.city} was successfully updated."
      redirect_to location_path(@location)
    else
      flash[:alert] = "#{@location.city} was NOT successfully updated."
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
      :open_date,
      course_ids: []
    )
  end
end
