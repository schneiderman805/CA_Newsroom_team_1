class Users::UserInfoSerializer < ActiveModel::Serializer
    attributes :first_name, :email
end