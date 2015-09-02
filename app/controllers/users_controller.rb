class UsersController < ApplicationController

  def new
    user = User.new
  end

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User information updated"
      redirect_to edit_user_registration_path
    else
      flash[:error] = "Invalid user information"
      redirect_to edit_user_registration_path
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @user_vinyls = current_user.vinyls
    @user_reviews = current_user.reviews
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
