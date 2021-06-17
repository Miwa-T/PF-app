class Public::PostImagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @post_images = PostImage.all

  end

  def show
    @post_image = PostImage.find(params[:id])
    @comment = Comment.new

  end

  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)

    @post_image.user_id = current_user.id
    if @post_image.save

      redirect_to post_image_path(@post_image.id)
    else
      render :new
    end
  end

  def edit
    @post_image = PostImage.find(params[:id])
  end

  def update
    @post_image = PostImage.find(params[:id])
    @post_image.update(post_image_params)
    redirect_to post_image_path(@post_image.id)
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to user_path(@post_image.user)
  end

  def ranking
    @all_ranks = PostImage.find(Favorite.group(:post_image_id).order('count(post_image_id)desc').limit(12).pluck(:post_image_id))
  end

  private
  def post_image_params
    params.require(:post_image).permit(:image, :explain, :title)
  end

end

