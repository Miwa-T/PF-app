class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images
    @follow = current_user.active_relationsips.first
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def unsubscribe
    @user = User.find(params[:id])
  end

  def withdraw
    @user = User.find(current_user.id)
    @user.update(is_deleted: "Available")
    reset_session
    redirect_to root_path
  end

  def follows
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

  private
  def user_params
    params.require(:user).permit(:name, :account_name, :email, :number, :profile_image, :introduction)
  end
end
