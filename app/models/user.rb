#AAA
class User < ApplicationRecord
  before_create :create_uuid
  #before_save :generate_token
  has_many :games

  def self.create_user(auth_hash)
    User.create(
    email: auth_hash.info.email,
    name: auth_hash.info.name,
    )
  end


  def generate_token
    self.token = SecureRandom.urlsafe_base64
  end

  def create_uuid
    begin
      self.uuid = SecureRandom.uuid
    end while self.class.exists?(:uuid => uuid)
  end
end
