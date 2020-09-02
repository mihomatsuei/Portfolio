class UsersController < ApplicationController
 before_action :ensure_correct_user, only: [:update]

  def show
    @user = User.find(params[:id])
    @post = Post.new # 新規投稿用の空のインスタンス
    @posts = @user.posts # @userの投稿した(@userに関連した)投稿 user.rbのhas_many :postsより
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
    else
    redirect_to user_path(current_user.id) #users#show
    end
  end

  def update
       @user = User.find(params[:id])
    if @user.update(user_params)
      # users_path(@user)user#indexをuser_path(@user.id)user#showへ変更→編集成功になる
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  def index
    @users = User.all
    @user = current_user
    @post = Post.new # 新規投稿用の空のインスタンス
  end

  def following
     @user = User.find(params[:id])
    # user 一覧で表示されている人がフォローした人全員
    # rails cでuser=User.find(11) user.follower_userでデータが返ってくることを確認。user.followingはno method error
     @users = @user.following_user #user.rbのhas_many :following_user
  end

  def followed
     @user = User.find(params[:id])
     # user 一覧で表示されている人のことをフォローした人全員
     @users = @user.follower_user #user.rbのhas_many :follower_user
  end


  private
  def user_params # userモデルのカラムのみを許可
    params.require(:user).permit(:name, :introduction, :profile_image, :beginner_thing, :beginner_period, :beginner_level, :expert_thing, :expert_period, :expert_level)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user.id)
    end
  end
end
