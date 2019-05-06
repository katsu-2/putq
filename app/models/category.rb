class Category < ApplicationRecord
  has_many :posts
  belongs_to :parent, class_name: :Category, optional: true
  has_many :children, class_name: :Category, foreign_key: :parent_id

  validates :name, presence: true
end
