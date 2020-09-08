class DoOurBestsController < ApplicationController
# お互いのidだけを保存するテーブル(中間テーブル)post_idとuser_idで判断
	def create
    # params[:id]ではない ルーティングで生成されるURIを見ればparams[:post_id]であることを確認できる
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
    #「current_userに関連したDo_our_bestクラスの新しいインスタンス」を作成
    # do_our_best.user_id = current_user.idが済んだ状態で生成されている
    # ログインしているユーザーがいいねするための空のインスタンス
    do_our_best = current_user.do_our_bests.new(post_id:@post_id)
    do_our_best.post_comment_id = params[:post_comment_id] if params[:post_comment_id]
    do_our_best.save
    @do_our_bests_count = DoOurBest.where(post_id:@post_id,post_comment_id:params[:post_comment_id]).count
   end

   def destroy
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
    #条件に合うデータをidの若い順に1つだけ取得
    do_our_best = current_user.do_our_bests.find_by(post_id: @post_id,post_comment_id:params[:post_comment_id])
    do_our_best.destroy
    @do_our_bests_count = DoOurBest.where(post_id:@post_id,post_comment_id:params[:post_comment_id]).count
   end
end
