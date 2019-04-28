class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :folder_posts, dependent: :destroy
  has_many :folders, through: :folder_posts

  #validation
  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true
  validates :answer, presence: true

  scope :recent, -> { order('created_at desc') }

  def self.search(search)
    if search
      where('title LIKE :search or content LIKE :search', { search: "%#{search}%"})
    else
      all
    end
  end
end
