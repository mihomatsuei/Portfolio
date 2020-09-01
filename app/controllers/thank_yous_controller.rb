class ThankYousController < ApplicationController
    # お互いのidだけを保存するテーブル(中間テーブル)post_idとuser_idで判断
	def create
    # params[:id]ではない ルーティングで生成されるURIを見ればparams[:post_id]であることを確認できる
    @post = Post.find(params[:post_id])
    #「current_userに関連したThank_youクラスの新しいインスタンス」を作成
    # thank_you.user_id = current_user.idが済んだ状態で生成されている
    # ログインしているユーザーがいいねするための空のインスタンス
    @thank_you = current_user.thank_yous.new(post_id: @post.id)
    @thank_you.save
    redirect_back(fallback_location: posts_path)
     end

   def destroy
    @post = Post.find(params[:post_id])
    #条件に合うデータをidの若い順に1つだけ取得
    @thank_you = current_user.thank_yous.find_by(post_id: @post.id)
    @thank_you.destroy
    redirect_back(fallback_location: posts_path)
   end

end
