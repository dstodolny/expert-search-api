class UserSerializer < ApplicationSerializer
  attributes :id, :name, :url, :short_url

  has_many :headers
  has_many :friends, include: true, root: :users
end
