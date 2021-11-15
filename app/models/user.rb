require "digest"

class User < ApplicationRecord
  validates :email, :username, presence: true

  before_create :encrypt_password

  private
  def encrypt_password
    salted_password = "xy#{self.password.reverse}hellohey"
    self.password = Digest::SHA1.hexdigest(salted_password)
  end
end
