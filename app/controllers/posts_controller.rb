class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.includes(:user)
    @search = Post.search(params[:q])
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
    @posts = Post.all
  end

  def show
    # ブラウザのurlと同じidのpostのデータが欲しい@find_post=データを持ったpost
    @find_post = Post.find(params[:id])
    # @post=データを持っていない空のpost(新規投稿用の空のインスタンス)
    @post = Post.new
    # データを持ったpostのユーザー(@find_postの投稿をしたuser)
    @user = @find_post.user
    @post_comment = PostComment.new
    # 与えられた条件にマッチするレコードをすべて返す
    # ポストコメントモデルに入っている中でpost_idが一緒のものを全てとってきたい(where=条件に合うデータを複数取得)
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
