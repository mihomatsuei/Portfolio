class PostCommentsController < ApplicationController
def create
    #フォームから送られてきたデータ(body)をストロングパラメータを経由して@commentに代入
    @comment = current_user.post_comments.new(post_comment_params)
     # @commentの中に入っているpost_id
    @comment.post_id = params[:post_comment][:post_id]
    @comment.save
    # 投稿後そのままpost detail(post#showのまま)
    redirect_to post_path(params[:post_comment][:post_id])
   end

   def destroy
   PostComment.find(params[:id]).destroy
   	# 削除後そのまま(post#showのまま)
    redirect_back(fallback_location: posts_path)
   end

   private
   def post_comment_params
    params.require(:post_comment).permit(:comment)
   end


end
