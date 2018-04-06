class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.build = Build.find(params[:build_id])
    @comment.user = current_user
    if @comment.save
      redirect_to "/builds/#{params[:build_id]}", notice: 'Your comment was successfully posted!'
    else
      redirect_to "/builds/#{params[:build_id]}", notice: "Your comment wasn't posted!"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
