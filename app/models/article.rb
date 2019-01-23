class Article < ApplicationRecord
  has_one_attached :image
  validates_presence_of  :title, :lede, :body
  belongs_to :user
  belongs_to :category
  has_many :comments

  validates_presence_of  :title, :lede, :body, :category_id, :user_id

  scope :all_published, -> { where(published: true) }
  def published?
    published
  end
end
