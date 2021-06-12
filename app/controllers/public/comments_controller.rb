class Public::CommentsController < ApplicationController

  def create
    @post_image = PostImage.find(params[:post_image_id])
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.post_image_id = @post_image.id
    comment.save
  end

  def destroy
    Comment.find_by(id: params[:id], post_image_id: params[:post_image_id]).destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
