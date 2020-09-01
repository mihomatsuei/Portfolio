class RelationshipsController < ApplicationController
# belongs_to 変更したい親モデル名, class_name: "元々の親モデル名"
# Followerモデル、Followedモデルを擬似的に作り出す
belongs_to :follower, class_name: "User"
belongs_to :followed, class_name: "User"
validates :follower_id, presence: true
validates :followed_id, presence: true

end
