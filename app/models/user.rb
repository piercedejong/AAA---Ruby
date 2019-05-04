#AAA
class User < ApplicationRecord
  before_create :create_uuid
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  #before_save :generate_token
  has_many :games
  validates :email, :uniqueness => { :case_sensitive => false }, format: { with: URI::MailTo::EMAIL_REGEXP }, length: {maximum: 256}
  validates :name, :uniqueness => { :case_sensitive => false }, format:{ with: /\A[a-zA-Z0-9]+\z/i, message: "can only contain letters and numbers." }, length: { in: 5..20, message: "must be between 5 and 20 characters long"}
  validates :password, length: { in: 6..20}
  has_one :battle_calculator
  has_secure_password

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
