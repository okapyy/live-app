class Tag < ApplicationRecord
  has_many :videos_tags
  has_many :videos, through: :videos_tags

  validates :text, presence: true
end
