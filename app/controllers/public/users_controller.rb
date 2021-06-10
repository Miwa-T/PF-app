class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images
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
  end

  def withdraw
  end

  private
  def user_params
    params.require(:user).permit(:name, :account_name, :email, :number, :profile_image, :introduction)
  end
end
