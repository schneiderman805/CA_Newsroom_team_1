class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments

  validates_presence_of  :title, :lede, :body, :category_id, :user_id
end
