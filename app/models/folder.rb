class Folder < ApplicationRecord
  has_many :folder_posts
  has_many :posts, through: :folder_posts
end
