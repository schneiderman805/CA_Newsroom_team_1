class Articles::IndexSerializer < ActiveModel::Serializer
	include Rails.application.routes.url_helpers
	attributes :id, :title, :lede, :body
	belongs_to :user, serializer: Users::UserInfoSerializer
	belongs_to :category, serializer: Categories::CategoriesInfoSerializer
end