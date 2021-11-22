require "digest"

class User < ApplicationRecord
  validates :email, :username, presence: true

  has_many :courses

  before_create :encrypt_password

  def self.login(user_info)
    email = user_info[:email]
    password = user_info[:password]

    salted_password = "xy#{password.reverse}hellohey"
    encryted_password = Digest::SHA1.hexdigest(salted_password)

    self.find_by(email: email, password: encryted_password)
  end

  private
  def encrypt_password
    salted_password = "xy#{self.password.reverse}hellohey"
    self.password = Digest::SHA1.hexdigest(salted_password)
  end
end
