class Photo < ActiveRecord::Base
  mount_uploader :file, PictureUploader
end
