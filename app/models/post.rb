class Post < ApplicationRecord

  mount_uploader :audio, AudioDataUploader
end
