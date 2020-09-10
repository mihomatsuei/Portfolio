class DoOurBestsController < ApplicationController
	before_action :set_do_our_best



  def create
    do_our_best = current_user.do_our_bests.new(post_id:@post_id)
    do_our_best.post_comment_id = params[:post_comment_id] if params[:post_comment_id]
    do_our_best.save
    @do_our_bests_count = DoOurBest.where(post_id:@post_id,post_comment_id:params[:post_comment_id]).count
   end

   def destroy
    do_our_best = current_user.do_our_bests.find_by(post_id: @post_id,post_comment_id:params[:post_comment_id])
    do_our_best.destroy
    @do_our_bests_count = DoOurBest.where(post_id:@post_id,post_comment_id:params[:post_comment_id]).count
   end

private

    def set_do_our_best
      if params[:post_id]
      @post_or_comment = Post.find(params[:post_id])
      @post_id = params[:post_id]
      @do_our_best_class = "post_#{@post_or_comment.id}"
      @do_our_best_path = post_do_our_bests_path(@post_or_comment)
    else
      @post_or_comment = PostComment.find(params[:post_comment_id])
      @post_id = @post_or_comment.post_id
      @do_our_best_class = "post_comment_#{@post_or_comment.id}"
      @do_our_best_path = post_comment_do_our_bests_path(@post_or_comment)
    end
    @user = @post_or_comment.user
    @post_comments = PostComment.where(post_id: @post_id)

    end


end
