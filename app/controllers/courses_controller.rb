class CoursesController < ApplicationController

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
    @locations = Location.all
  end

  def create
    @locations = Location.all
    @course = Course.create course_params
    if @course.save
      flash[:notice] = "#{@course.name} course successfully saved."
      redirect_to courses_path
    else
      flash[:alert] = "#Course NOT successfully saved."
      render :new
    end
  end

  def show
    @course = Course.find params[:id]
    @locations = @course.locations
  end

  def edit
    @course = Course.find params[:id]
    @locations = Location.all
  end

  def update
    @course = Course.find params[:id]
    if @course.update course_params
      flash[:notice] = "#{@course.name} successfully updated."
      redirect_to course_path(@course)
    else
      flash[:alert] = "#{@course.name} NOT successfully updated."
      render :edit
    end
  end

  def destroy
    @course = Course.find params[:id]
    @course.delete
    flash[:notice] = "Course successfully deleted."
    redirect_to courses_path

  end

private
  def course_params
    params.require(:course).permit(
      :name,
      :description,
      location_ids: []
      )
  end



end
