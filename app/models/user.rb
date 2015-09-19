class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_encrypted :token, key: Rails.application.secrets.secret_key_base, mode: :per_attribute_iv_and_salt

  after_initialize :generate_token

  private
    def generate_token
      self.token ||= SecureRandom.hex
    end
end
