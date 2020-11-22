class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books
  attachment :profile_image, destroy: false

  validates :name, length: { in: 2..20 }, uniqueness: true, presence: true
  validates :introduction, length: { maximum: 50 }

  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  #フォロー取得のメソッド
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  #フォロワー取得のメソッド
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  #自分がフォローしている人
  has_many :following_user, through: :follower, source: :followed
  #自分をフォローしている人
  has_many :follower_user, through: :followed, source: :follower


  #ユーザーをフォローするメソッド
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  #ユーザーのフォローを外すメソッド
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  #フォローしていればtrueを返すメソッド
  def following?(user)
    following_user.include?(user)
  end


  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

end
