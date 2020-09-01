class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  attachment :profile_image, destroy: false
  has_many :post_comments, dependent: :destroy
  has_many :thank_yous, dependent: :destroy
  has_many :do_our_bests, dependent: :destroy

# has_many relationshipsをふた通り書かなくてはならず、名前被りが起きてしまうためフォローする側、される側ふた通りの中間テーブルの名前を再定義
# class_name 関連するモデルクラス名を指定。関連名と参照先のクラス名を分けたい場合に使う

# ==============自分がフォローしているユーザーとの関連 ===================================
#フォローする側のUserからみたRelationship=follower
#フォローする側のUserから見て、フォローされる側のUserを(中間テーブルを介して)集める。なので親はfollower_id(フォローする側)
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # フォロー取得
# 中間テーブルを介して「followed」モデルのUser(フォローされた側)を集めることを「followings_user」と定義
  has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人

# ==============自分がフォローされるユーザーとの関連 ===================================
#フォローされる側のUserから見て、フォローしてくる側のUserを(中間テーブルを介して)集める。なので親はfollowered_id(フォローされる側)
#フォローされる側のUserからみたRelationship=followed
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # フォロワー取得
# 中間テーブルを介して「follower」モデルのUser(フォローする側)を集めることを「follower_user」と定義
  has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人

  #バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
  validates :name, length: {maximum: 20, minimum: 2}
  validates :introduction, length: { maximum: 500 }

# ユーザーをフォローする
def follow(user_id)
  follower.create(followed_id: user_id)
end

# ユーザーのフォローを外す
def unfollow(user_id)
  follower.find_by(followed_id: user_id).destroy
end

# フォローしていればtrueを返す
def following?(user)
  following_user.include?(user)
end

end
