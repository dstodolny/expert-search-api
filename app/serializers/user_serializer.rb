class UserSerializer < ActiveModel::Serializer
  attributes :name, :url, :short_url
end
