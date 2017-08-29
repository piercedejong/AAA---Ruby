class Nation < ApplicationRecord
  before_create :create_uuid
  belongs_to :game
  has_many :objectives
  default_scope { order(created_at: :asc) }

  def create_uuid
    begin
      self.uuid = SecureRandom.uuid
    end while self.class.exists?(:uuid => uuid)
  end


  protected



    def self.create_1940(game_uuid)
      nations = [
        {nid: 0, name: 'Germany',roundel: 'germany.png', color: '#282828', colorL: '#8a8d8f', bank: 30,income: 30},
        {nid: 1, name: 'USSR',roundel: 'ussr.png', color: '#872323', colorL: '#d55d5d', bank: 37,income: 37},
        {nid: 2, name: 'Japan',roundel: 'japan.png', color: '#b56f2f', colorL: '#e0b185', bank: 26,income: 26},
        {nid: 3, name: 'USA',roundel: 'usa.png', color: '	#5a8232', colorL: '#a6cd7e', bank: 52,income: 52},
        {nid: 4, name: 'China',roundel: 'china.png', color: '	#bdb036', colorL: '#ddd588', bank: 12,income: 12},
        {nid: 5, name: 'Britain',roundel: 'britain.png', color: '#d4ac80', colorL: '#e4ceb4', bank: 28,income: 28},
        {nid: 6, name: 'Pacific',roundel: 'pacific.png', color: '#d4ac80', colorL: '#e4ceb4', bank: 17,income: 17},
        {nid: 7, name: 'Italy',roundel: 'italy.png', color: '	#754100', colorL: '#995f16', bank: 10,income: 10},
        {nid: 8, name: 'ANZAC',roundel: 'anzac.png', color: '#87746d', colorL: '#c6bcb8', bank: 10,income: 10},
        {nid: 9, name: 'France',roundel: 'france.png', color: '	#3e6d91', colorL: '#a6c3d9', bank: 19,income: 19},
      ]
      nations.each do |n|
        Game.find_by(uuid: game_uuid).nations.create(n)
      end
    end

    def self.create_1942(game_uuid)
      nations = [
        {nid: 0, name: 'USSR',roundel: 'ussr.png', color: '135,35,35', colorL: '', bank: 24,income: 24},
        {nid: 1, name: 'Germany',roundel: 'germany.png', color: '30,30,30', colorL: '', bank: 41,income: 41},
        {nid: 2, name: 'United Kingdom',roundel: 'britain.png', color: '212,173,128', colorL: '', bank: 31,income: 31},
        {nid: 3, name: 'Japan',roundel: 'japan.png', color: '170,90,30', colorL: '', bank: 30,income: 30},
        {nid: 4, name: 'USA',roundel: 'usa.png', color: '90,130,50', colorL: '', bank: 42,income: 42},
      ]
      nations.each do |n|
        Game.find_by(uuid: game_uuid).nations.create(n)
      end
    end


end
