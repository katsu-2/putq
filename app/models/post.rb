class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_many :comments

  #validation
  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true
  validates :answer, presence: true
end
