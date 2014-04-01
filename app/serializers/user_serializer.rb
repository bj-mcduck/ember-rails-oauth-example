class UserSerializer < ActiveModel::Serializer
  attributes :id, :screen_name, :email
end