class User < ApplicationRecord
  has_many :pictures
  validates :username, uniqueness: true, presence: true, on: [:update, :create]
  validates :username, presence: true, on: :login
  has_secure_password
end
