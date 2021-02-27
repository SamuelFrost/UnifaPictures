class Picture < ApplicationRecord
  belongs_to :user
  has_one_attached :picture_file
  validates :picture_file, presence: true
  validates :title, presence: true, length: {maximum: 30}
end
