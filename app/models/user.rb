class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  # validates :contact, uniqueness: true

  has_secure_password
end
