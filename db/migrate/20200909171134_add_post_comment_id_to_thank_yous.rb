class AddPostCommentIdToThankYous < ActiveRecord::Migration[5.2]
  def change
    add_column :thank_yous, :post_comment_id, :integer
  end
end
