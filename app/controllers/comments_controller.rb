class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.blog_id = params[:blog_id]
    if @comment.save
      redirect_to blog_path(@comment.blog)
    else
      # redirect_to blog_path(@comment.blog, @comment.errors)
      # render "blogs/_header"
    end
  end
  
  def comment_params
    params.require(:comment).permit(:name, :comment)
  end
end
