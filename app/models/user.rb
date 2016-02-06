class User < ApplicationRecord
  validates :name, presence: true
  validates :url, presence: true, url: true
  validates :short_url, url: true

  has_many :headers
end
