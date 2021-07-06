class User < ApplicationRecord
  has_secure_password
  email_format = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, :email, :password_digest , presence: true
  validates :email, format: {with: email_format}
  validates :email, uniqueness: true
  before_save :downcase_email

  private
    def downcase_email
      self.email.downcase!
    end
end
