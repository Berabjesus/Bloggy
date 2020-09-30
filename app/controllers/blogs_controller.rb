class BlogsController < ApplicationController
  def index
    if session[:bloggy_user_id_session].nil?
      redirect_to sessions_new_path, notice: 'Login or Sign up to view blogs.' 
    end
    @blogs = Blog.all
    @user = current_user
  end
  
  def new
    @user = current_user
    @blog = Blog.new
  end

  def create
    @user = current_user
    @blog = Blog.new(blog_params)
    @blog.user_id = @user.id
    if @blog.save
      redirect_to blog_path(@blog)
    else
      render 'new'
    end
    # @blog.title = params[:blog][:title]
    # @blog.content = params[:blog][:content]
  end

  def show
    @user = current_user
    @blog = Blog.find(params[:id])
    @comment = Comment.new
    @comment.blog_id = @blog.id
    # if !@comment.valid?
    #   render 'show'
    # end
  end

  def edit
    @user = current_user
    @blog = Blog.find(params[:id])
  end

  def update
    @user = current_user
    @blog = Blog.find(params[:id])
    if current_user.id == @blog.user_id
      if @blog.update(blog_params)
        redirect_to blog_path
      else
        render 'show'
      end
    else
      redirect_to blogs_path, alert: "You dont own this post"
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    if current_user.id == @blog.user_id
      if @blog.destroy
        redirect_to blogs_path
      else
        # error
      end
    end
  end

  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
