class Video < ApplicationRecord
  has_many :favorites
  has_many :users, through: :favorites
  has_many :videos_tags
  has_many :tags, through: :videos_tags

  validates :video, presence: true
end
