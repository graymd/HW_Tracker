class SubmissionsController < ApplicationController

  def index
    @assignment = Assignment.find params[:assignment_id]
    @submissions = Submission.all
  end

  def new
    @assignment = Assignment.find params[:assignment_id]
    @submission = @assignment.submissions.new
    @submission.user = current_user
  end

  def create
    @assignment = Assignment.find params[:assignment_id]
    @submission = @assignment.submissions.create submission_params
    @submission.user = current_user
    if @submission.save
      flash[:notice] = "#{@submission.name} successfully saved."
      redirect_to assignment_path(@assignment)
    else
      flash[:alert] = "Submission NOT successfully saved."
      render :new
    end

  end

  def show
    @assignment = Assignment.find params[:assignment_id]
    @submission = Submission.find params[:id]
  end

  def edit
    @assignment = Assignment.find params[:assignment_id]
    @submission = @assignment.submissions.find params[:id]
  end

  def update
    @assignment = Assignment.find params[:assignment_id]
    @submission = @assignment.submissions.find params[:id]
    @submission.user = current_user
    if @submission.update_attributes submission_params
      flash[:notice] = "#{@submission.name} submission was successfully updated."
      redirect_to assignment_submission_path(@assignment, @submission)
    else
      flash[:alert] = "Submission NOT successfully udated."
      render :edit
    end

  end

  def destroy
    @assignment = Assignment.find params[:assignment_id]
    @submission = @assignment.submissions.find params[:id]
    @submission.delete
    flash[:notice] = "Submission successfully deleted."
    redirect_to assignment_path(@assignment)
  end

private
  def submission_params
    params.require(:submission).permit(
      :name,
      :input,
      :assignment_id,
      :user_id)
  end

end
















