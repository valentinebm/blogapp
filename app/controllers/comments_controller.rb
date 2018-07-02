class CommentsController < ApplicationController
  http_basic_authenticate_with name: "valentine", password: "valentine", only: [:destroy]

  def create
    @post= Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post= Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to posts_path
  end

  private def comment_params
    params.require(:comment).permit(:username, :body)
  end
end
