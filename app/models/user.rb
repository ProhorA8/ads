class User < ApplicationRecord
  DIGEST = OpenSSL::Digest::SHA256.new
  USERNAME_REGEXP = /\A\w+\z/

  has_many :ads, dependent: :destroy

  validates :username, :email, presence: true, uniqueness: true
  validates :username, length: { maximum: 40 }, format: { with: USERNAME_REGEXP }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
