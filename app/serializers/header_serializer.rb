class HeaderSerializer < ApplicationSerializer
  attributes :id, :user_id, :importance, :content

  belongs_to :user
end
