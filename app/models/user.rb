#AAA
class User < ApplicationRecord
  before_create :create_uuid
  has_many :game_data


  def self.create_user(auth_hash)
    User.create(
    email: auth_hash.info.email,
    name: auth_hash.info.name,
    )
  end

  def create_uuid
    begin
      self.uuid = SecureRandom.uuid
    end while self.class.exists?(:uuid => uuid)
  end
end
