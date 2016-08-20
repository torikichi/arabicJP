class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_secure_password

  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :password, confirmation: true, length: {minimum: 8}
  validates :password_confirmation, presence: true
  validates :email, uniqueness: true
end
