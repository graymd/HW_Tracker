class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    @user.update user_params
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find params[:id]
    @user.delete
    redirect_to users_path
  end

private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :github_account,
      :admin
      )
  end

end
