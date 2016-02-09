class UserSerializer < ApplicationSerializer
  attributes :name, :url, :short_url, :friends_ids

  def friends_ids
    object.friends.pluck(:id)
  end
end
