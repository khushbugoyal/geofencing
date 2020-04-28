class Picture < ApplicationRecord
  belongs_to :location
  mount_uploader :photo, PictureUploader
end
