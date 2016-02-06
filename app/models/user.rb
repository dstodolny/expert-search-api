class User < ApplicationRecord
  validates :name, presence: true
  validates :url, presence: true, url: true
end
