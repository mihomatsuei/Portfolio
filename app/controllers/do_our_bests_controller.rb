class DoOurBestsController < ApplicationController
# お互いのidだけを保存するテーブル(中間テーブル)post_idとuser_idで判断
	def create
    # params[:id]ではない ルーティングで生成されるURIを見ればparams[:post_id]であることを確認できる
    #@posts = Post.all
    @post = Post.find(params[:post_id])
    @user = @post.user
    @post_comments = PostComment.where(post_id: @post.id)
    #「current_userに関連したDo_our_bestクラスの新しいインスタンス」を作成
    # do_our_best.user_id = current_user.idが済んだ状態で生成されている
    # ログインしているユーザーがいいねするための空のインスタンス
    do_our_best = current_user.do_our_bests.new(post_id:params[:post_id])
    do_our_best.save
   end

   def destroy
    #@posts = Post.all
    @post = Post.find(params[:post_id])
    @user = @post.user
    @post_comments = PostComment.where(post_id: @post.id)
    #条件に合うデータをidの若い順に1つだけ取得
    do_our_best = current_user.do_our_bests.find_by(post_id: params[:post_id])
    do_our_best.destroy
   end
end
