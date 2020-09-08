class AddPostCommentIdToDoOurBests < ActiveRecord::Migration[5.2]
  def change
    add_column :do_our_bests, :post_comment_id, :integer
  end
end
