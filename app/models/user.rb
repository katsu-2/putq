class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post

  #ユーザーが投稿に対して既にいいねしているか
  def already_liked?(post)
    likes.exists?(post_id: post.id)
  end
end