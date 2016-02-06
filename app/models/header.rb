class Header < ApplicationRecord
  validates :user_id, presence: true
  validates :importance, presence: true
  validates :content, presence: true

  belongs_to :user

  enum importance: [:h1, :h2, :h3]
end
