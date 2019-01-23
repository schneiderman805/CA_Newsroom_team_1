class Articles::IndexSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :lede, :body
  belongs_to :user, serializer: Users::UserInfoSerializer
  belongs_to :category, serializer: Categories::CategoriesInfoSerializer

  def image
    if Rails.env.test?
      rails_blob_url(object.image)
    else
      object & image&.service_url(expires_in: 1.minute, disposition: 'inline')
    end
  end
end