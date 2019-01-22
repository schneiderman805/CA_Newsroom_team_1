class Articles::IndexSerializer < ActiveModel::Serializer
	include Rails.application.routes.url_helpers
	attributes :id, :title, :lede, :body
	belongs_to :user, serializer: Users::UserInfoSerializer
end