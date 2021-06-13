class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:user_id])
    @follow = current_user.active_relationsips.build(follower_id: params[:user_id])
    @follow.save
  end

  def destroy
    @user = User.find(params[:user_id])
    @follow = current_user.active_relationsips.find_by(follower_id: params[:user_id])
    @follow.destroy
  end
end
