require 'openssl'

class User < ApplicationRecord
  DIGEST = OpenSSL::Digest::SHA256.new
  USERNAME_REGEXP = /\A\w+\z/.freeze

  has_many :ads, dependent: :destroy

  validates :username, :email, presence: true, uniqueness: true
  validates :username, length: { maximum: 40 }, format: { with: USERNAME_REGEXP }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  # validates :password, presence: true, on: :create
  # validates_confirmation_of :password

  # before_save :encrypt_password

  def self.authenticate(email, password)
    user = find_by(email: email&.downcase)

    return nil unless user.present?

    hashed_password = User.hash_to_string(OpenSSL::PKCS5.pbkdf2_hmac(password,
                                                                     user.password_salt,
                                                                     ITERATIONS,
                                                                     DIGEST.length,
                                                                     DIGEST))

    return user if user.password_hash == hashed_password

    nil
  end

  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  private

  def downcase_params
    username&.downcase!
    email&.downcase!
  end
end
