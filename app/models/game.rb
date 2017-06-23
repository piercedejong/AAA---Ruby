class Game < ApplicationRecord
  before_create :create_uuid
  belongs_to :user
  has_many :nations
  has_many :units
  validates :name, presence: true, length: {minimum: 3}
  validates :game_name, presence: true, length: {minimum: 1}

  def create_uuid
    begin
      self.uuid = SecureRandom.uuid
    end while self.class.exists?(:uuid => uuid)
  end
end
