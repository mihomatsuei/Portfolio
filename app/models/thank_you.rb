class ThankYou < ApplicationRecord

	belongs_to :user
    belongs_to :post
    belongs_to :post_comment, optional:true

    #validates_uniqueness_of :post_id, scope: :user_id
end
