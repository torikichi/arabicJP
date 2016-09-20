class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_secure_password
  has_paper_trail

  before_save { self.email = email.downcase }
  validates :name, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :password, confirmation: true, length: {minimum: 8}
  validates :password_confirmation, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: { case_sensitive: false }, length: { maximum: 255 },format: { with: VALID_EMAIL_REGEX }
end
