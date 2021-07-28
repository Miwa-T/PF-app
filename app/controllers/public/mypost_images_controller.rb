class Public::MypostImagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @post_images = PostImage.where(user_id: current_user.id)
  end
end
