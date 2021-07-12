class User < ApplicationRecord
  has_secure_password

  has_many :secrets
  has_many :likes, dependent: :destroy
  #has_many :secrets, through: :likes
  #we're going to have to give an alias to one of our has_many relationships and use :source to explicitly tell Rails which table we're referring to.

  #has secrets through likes table
  has_many :secrets_liked, through: :likes, source: :secret

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
