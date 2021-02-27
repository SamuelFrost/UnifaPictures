class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true, on: [:update, :create]
  validates :username, presence: true, on: :login
  has_secure_password
end
