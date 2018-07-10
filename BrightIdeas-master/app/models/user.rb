class User < ActiveRecord::Base
  has_secure_password
  has_many :ideas, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :ideas_liked, through: :likes, source: :idea
  validates :name, :email, :alias, presence: true, length: { in: 2..255 }
  validates :password, length: { in: 8..255 }, presence: true, on: :create
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false}
end
