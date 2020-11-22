class Relationship < ApplicationRecord
  #belongs_to :follower, class_name: "User"

  #フォローするユーザーを取り出す記述
  belongs_to :follower, class_name: "User"

  #フォローされているユーザーを取り出す記述
  belongs_to :followed, class_name: "User"

  validates :follower_id, presence: true
  validates :followed_id, presence: true


end