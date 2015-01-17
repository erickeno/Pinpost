class Board < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence:true

  has_many :pins, dependent: :destroy
end
