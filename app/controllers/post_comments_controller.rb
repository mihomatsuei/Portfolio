class PostCommentsController < ApplicationController
def create
    @comment = current_user.post_comments.new(post_comment_params)
    @comment.post_id = params[:post_comment][:post_id]
    @comment.save
    redirect_to post_path(params[:post_comment][:post_id])
   end

   def destroy
   PostComment.find(params[:id]).destroy
    redirect_back(fallback_location: posts_path)
   end

   private
   def post_comment_params
    params.require(:post_comment).permit(:comment)
   end


end
