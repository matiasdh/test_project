class User < ActiveRecord::Base

  EMAIL_REGEX = /@/

  validates :first_name,    presence: true
  validates :last_name,     presence: true
  validates :email,         format: { with: EMAIL_REGEX },
                            presence: true,
                            uniqueness: true
  validates :password,      length: { minimum: 6 }, if: :update_password?
  validates :session_token, uniqueness: true

  before_save :encrypt_password

  attr_accessor :password

  def is_same_password?(pass)
    encrypted_password == pass.crypt(APP_CONFIG['crypt_key'])
  end

  private

  def encrypt_password
    if password.present?
      self.encrypted_password = password.crypt(APP_CONFIG['crypt_key'])
    end
  end

  def update_password?
    encrypted_password.blank? || password.present?
  end
end
