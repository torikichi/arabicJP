class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  # validates :contact, uniqueness: true

  has_secure_password
  validates :password, presence: true, length: {minimum: 8}
end
