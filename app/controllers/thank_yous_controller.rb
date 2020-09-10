class ThankYousController < ApplicationController
	def create
    @post_comment = PostComment.find(params[:post_comment_id])
    @user = current_user
    @thank_you = @post_comment.thank_yous.new(user_id: @user.id)
    @thank_you.save
     end

   def destroy
    @post_comment = PostComment.find(params[:post_comment_id])
    @user = current_user
    @post_comments = PostComment.where(user_id: @user.id)
    @thank_you = @post_comment.thank_yous.find_by(user_id: @user.id)
    @thank_you.destroy
   end

end
