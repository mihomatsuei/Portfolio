class Post < ApplicationRecord

	belongs_to :user
	has_many :post_comments, dependent: :destroy
	has_many :do_our_bests, dependent: :destroy

	def thank_you_by?(user)
      thank_yous.where(user_id: user.id).exists?
    end

    def do_our_best_by?(user)
      do_our_bests.where(user_id: user.id).where(post_comment_id:nil).exists?
    end

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
end
