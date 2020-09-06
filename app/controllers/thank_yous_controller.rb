class ThankYousController < ApplicationController
	def create
    @post = Post.find(params[:post_id])
    @user = @post.user
    @post_comments = PostComment.where(post_id: @post.id)
    @thank_you = current_user.thank_yous.new(post_id: @post.id)
    @thank_you.save
     end

   def destroy
    @post = Post.find(params[:post_id])
    @user = @post.user
    @post_comments = PostComment.where(post_id: @post.id)
    @thank_you = current_user.thank_yous.find_by(post_id: @post.id)
    @thank_you.destroy
   end

end
