class PostsController < ApplicationController
  def index
    @posts = Post.all #postモデルからすべてのインスタンス取得
    @post = Post.new # 新規投稿用の空のインスタンス
    @user = current_user
    # @post_comments = PostComment.where(post_id: @post.id)は定義しなくてOK
  end

  def new
    @posts = Post.all #postモデルからすべてのインスタンス取得
    @post = Post.new # 新規投稿用の空のインスタンス
    @user = current_user
    # @post_comments = PostComment.where(post_id: @post.id)は定義しなくてOK
  end

  def create
    @user = current_user
    @posts = Post.all #postモデルからすべてのインスタンス取得
    @post = Post.new(post_params) # フォームから送られてきたデータ(body)をストロングパラメータを経由して@postに代入
    @post.user_id = current_user.id# user_idの情報はフォームからはきていないので、deviseのメソッドを使って「ログインしている自分のid」を代入
    if @post.save
      redirect_to post_path(@post.id), notice: "You have created post successfully."
    else
      render 'index'
    end
  end

  def show
    # ブラウザのurlと同じidのpostのデータが欲しい@find_post=データを持ったpost
    @find_post = Post.find(params[:id])
    # @post=データを持っていない空のpost(新規投稿用の空のインスタンス)
    @post = Post.new
    # データを持ったpostのユーザー(@find_postの投稿をしたuser)
    @user = @find_post.user
    # 新規投稿用の空のインスタンス
    @post_comment = PostComment.new
    # 与えられた条件にマッチするレコードをすべて返す
    # ポストコメントモデルに入っている中でpost_idが一緒のものを全てとってきたい(where=条件に合うデータを複数取得)
    @post_comments = PostComment.where(post_id: @find_post.id)
  end

  def edit
    @post = Post.find(params[:id])
    @user = @post.user #@postの投稿をしたuser
    if @user == current_user
    else
       redirect_to posts_path #post#indexへ
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id), notice: "You have updated post successfully."
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "successfully delete post!"
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
