class GameDatum < ApplicationRecord
  before_create :create_uuid
  belongs_to :user
  has :game

  def create_uuid
    begin
      self.uuid = SecureRandom.uuid
    end while self.class.exists?(:uuid => uuid)
  end
end
