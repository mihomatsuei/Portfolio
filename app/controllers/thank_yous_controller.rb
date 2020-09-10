class ThankYousController < ApplicationController
	def create
    @comment = Comment.find(params[:comment_id])
    @user = @comment.user
    @post_comments = PostComment.where(comment_id: @comment.id)
    @thank_you = current_user.thank_yous.new(comment_id: @comment.id)
    @thank_you.save
     end

   def destroy
    @comment = Comment.find(params[:comment_id])
    @user = @comment.user
    @post_comments = PostComment.where(comment_id: @comment.id)
    @thank_you = current_user.thank_yous.find_by(commentt_id: @comment.id)
    @thank_you.destroy
   end

end
