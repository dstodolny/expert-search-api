class User < ApplicationRecord
  validates :name, presence: true
  validates :url, presence: true, url: true
  validates :short_url, url: true

  has_many :headers
  has_many :friendships
  has_many :direct_friends, through: :friendships, source: :friend
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  def friends
    direct_friends | inverse_friends
  end

  def self.order_by_ids(ids)
    order_by = ["case"]
    ids.each_with_index.map do |id, index|
      order_by << "WHEN id='#{id}' THEN #{index}"
    end
    order_by << "end"
    order(order_by.join(" "))
  end
end
