class Pin < ActiveRecord::Base
  belongs_to :board
  validates :name, presence: true
  mount_uploader :image, ImageUploader
end
