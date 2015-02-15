class AssignmentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @assignments = Assignment.all
  end

  def new
    @assignment = Assignment.new
    @assignment.user = current_user
    authorize! :new, @assignment
  end

  def create
    @assignment = Assignment.create assignment_params
    @assignment.user = current_user
    if @assignment.save
      flash[:notice] = "#{@assignment.name} assignment successfully saved."
      redirect_to assignments_path
    else
      flash[:alert] = "Assignment NOT successfully saved."
      render :new
    end
  end

  def show
    @assignment = Assignment.find params[:id]
    @submissions = @assignment.submissions
    @comment = Comment.new
    @comments = @assignment.comments
  end

  def edit
    @assignment = Assignment.find params[:id]
    @assignment.user = current_user
    authorize! :edit, @assignment
  end

  def update
    @assignment = Assignment.find params[:id]
    @assignment.user = current_user
    if @assignment.update_attributes assignment_params
      flash[:notice] = "#{@assignment.name} assignment was successfully updated."
      redirect_to assignment_path(@assignment)
    else
      flash[:alert] = "Assignment NOT successfully updated."    
      render :edit
    end

  end

  def destroy
    @assignment = Assignment.find params[:id]
    @assignment.destroy
    authorize! :destroy, @assignment
    flash[:notice] = "Assignment successfully deleted."
    redirect_to assignments_path
  end

  def create_comment
    @assignment = Assignment.find params[:id]
    @comment = @assignment.comments.create comment_params
    @comment.user = current_user
    if @comment.save
      UserMailer.assignment_comment_email(current_user, @comment).deliver
    end
    redirect_to assignment_path(@assignment)
  end

  def destroy_comment
    @comment = Comment.find params[:id]
    @comment.destroy
    authorize! :destroy_comment, @comment
    redirect_to @comment.commentable
  end

private
  def assignment_params
    params.require(:assignment).permit(
      :name,
      :requirements,
      :user_id)
  end

  def comment_params
    params.require(:comment).permit(
      :content,
      :user_id)
  end

end
