class Video < ApplicationRecord
  # has_many :favorites
  belongs_to :users
  

  mount_uploader :video, VideoUploader
  validates :video, presence: true

  def self.search(search)
    if search
      Video.where('text LIKE(?)', "%#{search}%")
    else
      Video.all
    end
  end
end
