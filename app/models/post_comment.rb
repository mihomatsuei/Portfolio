class PostComment < ApplicationRecord
	belongs_to :user
    belongs_to :post
    has_many :do_our_bests, dependent: :destroy

validates :comment, presence: true
    def do_our_best_by?(user)
      do_our_bests.where(user_id: user.id).exists?
    end
end
