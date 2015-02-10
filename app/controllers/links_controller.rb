class LinksController < ApplicationController

  def index

  end

  def new
    @assignment = Assignment.find params[:assignment_id]
    @submission = Submission.find params[:submission_id]
    @link = @submission.links.new
  end

  def create
    @assignment = Assignment.find params[:assignment_id]
    @submission = Submission.find params[:submission_id]
    @link = @submission.links.create link_params
    if @link.save
      flash[:notice] = "Link saved."
      redirect_to assignment_submission_path(@assignment, @submission)
    else
      flash[:alert] = "Link NOT saved."
      render :new
    end
  end

  def show
    @assignment = Assignment.find params[:assignment_id]
    @submission = Submission.find params[:submission_id]
    @link = @submission.links.find params[:id]

  end

  def edit
    @assignment = Assignment.find params[:assignment_id]
    @submission = Submission.find params[:submission_id]
    @link = @submission.links.find params[:id]

  end

  def update
    @assignment = Assignment.find params[:assignment_id]
    @submission = Submission.find params[:submission_id]
    @link = @submission.links.find params[:id]
    if @link.update link_params
      flash[:notice] = "Link successfully updated."
      redirect_to assignment_submission_link_path(@assignment, @submission, @link)
    else
      flash[:alert] = "Link NOT successfully udpated."
      render :edit
    end
  end

  def destroy
    @assignment = Assignment.find params[:assignment_id]
    @submission = Submission.find params[:submission_id]
    @link = @submission.links.find params[:id]
    @link.delete
    flash[:notice] = "Link was successfully deleted."
    redirect_to assignment_submission_path(@assignment, @submission)

  end

private
  def link_params
    params.require(:link).permit(
      :url,
      :submission_id)
  end

end











