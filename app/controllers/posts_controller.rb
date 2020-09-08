class PostsController < ApplicationController

  def index
    @post = Post.new
    @search = Post.includes(:user).ransack(params[:q])
    @posts = @search.result
      respond_to do |format|
        format.html 
        format.json { render json: @posts }
      end
  end


  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    @search = Post.includes(:user).ransack(params[:q])
    @posts = @search.result
  end

  def show
    @find_post = Post.find(params[:id])
    @do_our_bests_count = @find_post.do_our_bests.where(post_comment_id:nil).count
    @post = Post.new
    @user = @find_post.user
    @post_comment = PostComment.new
    @post_comments = PostComment.where(post_id: @find_post.id)
  end

  def edit
    @post = Post.find(params[:id])
    @user = @post.user
    if @user == current_user
    else
       redirect_to posts_path
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
