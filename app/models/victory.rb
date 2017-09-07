class Victory < ApplicationRecord
  before_create :create_uuid
  belongs_to :game

  protected
    def self.create_1940_GrassHopper(game_uuid)
      victories = [
        {vid: 0, axis: true, text: },
        {vid: 1, axis: true, text: },
        {vid: 2, axis: true, text: },
        {vid: 3, axis: true, text: },
        {vid: 4, axis: true, text: },
        {vid: 5, axis: true, text: },
        {vid: 7, axis: true, text: },
        {vid: 6, axis: true, text: },
        {vid: 8, axis: true, text: },
        {vid: 9, axis: true, text: },
        {vid: 10, axis: false, text: },
        {vid: 12, axis: false, text: },
        {vid: 11, axis: false, text: },
        {vid: 13, axis: false, text: },
        {vid: 14, axis: false, text: },
        {vid: 15, axis: false, text: },
        {vid: 16, axis: false, text: },
        {vid: 17, axis: false, text: },
        {vid: 18, axis: false, text: },
      ]
      victories.each do |v|
        Game.find_by(uuid: game_uuid).victories.create(v)
      end
    end


  private
    def create_uuid
      begin
        self.uuid = SecureRandom.uuid
      end while self.class.exists?(:uuid => uuid)
    end
end
