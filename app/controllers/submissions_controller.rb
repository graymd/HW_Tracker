class SubmissionsController < ApplicationController
  before_action :authenticate_user!
  # before_filter :authorize_parent

  # def authorize_parent
  #   authorize! :comment, (@submission || @assignment)
  # end


  def index
    @assignment = Assignment.find params[:assignment_id]
    @submissions = Submission.all
    authorize! :read, Submission
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
    @comment = Comment.new
    @comments = @submission.comments
    @links = @submission.links
    authorize! :read, @submission
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

  def create_comment
    @assignment = Assignment.find params[:assignment_id]
    @submission = @assignment.submissions.find params[:id]
    @comment = @submission.comments.create comment_params
    @comment.user = current_user
    if @comment.save
      UserMailer.assignment_comment_email(current_user, @comment).deliver
    end
    redirect_to assignment_submission_path(@assignment, @submission)
  end

  def destroy_comment
    @comment = Comment.find params[:id]
    @comment.destroy
    authorize! :destroy_comment, @comment
    redirect_to assignment_submission_path(@comment.commentable.assignment, @comment.commentable)
  end

  def new_submission
    @assignment = Assignment.find params[:assignment_id]
    @submission = @assignment.submissions.find params[:id]
    @submission.new!
    redirect_to assignment_submission_path(@assignment, @submission)
  end

  def review_submission
    @assignment = Assignment.find params[:assignment_id]
    @submission = @assignment.submissions.find params[:id]
    @submission.review!
    redirect_to assignment_submission_path(@assignment, @submission)
  end

  def complete_submission
    @assignment = Assignment.find params[:assignment_id]
    @submission = @assignment.submissions.find params[:id]
    @submission.complete!
    redirect_to assignment_submission_path(@assignment, @submission)
  end

  def incomplete_submission
    @assignment = Assignment.find params[:assignment_id]
    @submission = @assignment.submissions.find params[:id]
    @submission.incomplete!
    redirect_to assignment_submission_path(@assignment, @submission)
  end



private
  def submission_params
    params.require(:submission).permit(
      :name,
      :input,
      :assignment_id,
      :user_id)
  end

  def comment_params
    params.require(:comment).permit(
      :content,
      :user_id)
  end

  

end
















