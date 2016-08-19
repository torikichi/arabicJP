class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_secure_password

  validates :password, confirmation: true, length: {minimum: 8}
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true
end
