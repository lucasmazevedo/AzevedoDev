class Client < ActiveRecord::Base
  mount_uploader :logotype, ImageUploader
end
