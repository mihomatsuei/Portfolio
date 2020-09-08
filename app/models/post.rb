class Post < ApplicationRecord

	belongs_to :user
	has_many :post_comments, dependent: :destroy
	has_many :thank_yous, dependent: :destroy
	has_many :do_our_bests, dependent: :destroy

	#「投稿をユーザーが頑張ろうね,ありがとうしているかどうか」を判定するメソッド
	def thank_you_by?(user)
      thank_yous.where(user_id: user.id).exists?
    end

    def do_our_best_by?(user)
      do_our_bests.where(user_id: user.id).where(post_comment_id:nil).exists?
    end
	#バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
	#presence trueは空欄の場合を意味する。
	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
end
