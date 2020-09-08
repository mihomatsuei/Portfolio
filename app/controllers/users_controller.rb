class UsersController < ApplicationController
 before_action :ensure_correct_user, only: [:update]


  def show
    @user = User.find(params[:id])
    @post = Post.new
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
    else
    redirect_to user_path(current_user.id)
    end
  end

  def choice
    @user = User.find(params[:id])
    if @user == current_user
    else
    redirect_to user_path(current_user.id)
    end
  end

  def update
       @user = User.find(params[:id])
    if @user.update(user_params)
       if user_params[:profile_image]=="{}"
        @user.profile_image_id = ""
        @user.save
       end
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def index
    @users = User.all
    @user = current_user
    @post = Post.new
    @search = User.search(params[:q])
    @users = @search.result.page(params[:page]).per(7)

    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end

  def following
     @user = User.find(params[:id])
     @users = @user.following_user
  end

  def followed
     @user = User.find(params[:id])
     @users = @user.follower_user
  end


  private
  def user_params
    params.require(:user).permit(:name,:email, :introduction, :profile_image, :beginner_thing, :beginner_period, :beginner_level, :expert_thing, :expert_period, :expert_level,:default_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user.id)
    end
  end
end
