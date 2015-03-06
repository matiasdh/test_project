class User < ActiveRecord::Base

  EMAIL_REGEX = /@/

  validates :first_name,    presence: true
  validates :last_name,     presence: true
  validates :email,         format: { with: EMAIL_REGEX },
                            presence: true,
                            uniqueness: true
  validates :password,      length: { minimum: 6 }, if: :update_password?
  validates :session_token, uniqueness: true, allow_blank: true

  before_save :encrypt_password

  attr_accessor :password

  def self.login_by(params = {})
    email = params[:email]
    password = params[:password]
    user = User.find_by email: email
    return nil unless user && user.is_same_password?(password)
    user.generate_token
    user
  end

  def is_same_password?(pass)
    encrypted_password == pass.crypt(APP_CONFIG['crypt_key'])
  end

  def generate_token
    self.session_token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless User.exists?(session_token: random_token)
    end
    save
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
