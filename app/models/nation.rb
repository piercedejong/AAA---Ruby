class Nation < ApplicationRecord
  belongs_to :game


  protected
    def self.create_1940(game_uuid)
      nations = [
        {nid: 0, name: 'Germany',roundel: 'germany.png', color: '30,30,30', bank: 30,income: 30},
        {nid: 1, name: 'USSR',roundel: 'ussr.png', color: '135,35,35', bank: 37,income: 37},
        {nid: 2, name: 'Japan',roundel: 'japan.png', color: '170,90,30', bank: 26,income: 26},
        {nid: 3, name: 'USA',roundel: 'usa.png', color: '90,130,50', bank: 52,income: 52},
        {nid: 4, name: 'China',roundel: 'china.png', color: '160,190,80', bank: 12,income: 12},
        {nid: 5, name: 'Britain',roundel: 'britain.png', color: '212,173,128', bank: 28,income: 28},
        {nid: 6, name: 'Pacific',roundel: 'pacific.png', color: '212,173,128', bank: 17,income: 17},
        {nid: 7, name: 'Italy',roundel: 'italy.png', color: '117,65,0', bank: 10,income: 10},
        {nid: 8, name: 'ANZAC',roundel: 'anzac.png', color: '115,115,115', bank: 10,income: 10},
        {nid: 9, name: 'France',roundel: 'france.png', color: '62,109,145', bank: 19,income: 19},
      ]
      nations.each do |n|
        Game.find_by(uuid: game_uuid).nations.create(n)
      end
    end

    def self.create_1942(game_uuid)
      nations = [
        {nid: 0, name: 'USSR',roundel: 'ussr.png', color: '135,35,35', bank: 24,income: 24},
        {nid: 1, name: 'Germany',roundel: 'germany.png', color: '30,30,30', bank: 41,income: 41},
        {nid: 2, name: 'United Kingdom',roundel: 'britain.png', color: '212,173,128', bank: 31,income: 31},
        {nid: 3, name: 'Japan',roundel: 'japan.png', color: '170,90,30', bank: 30,income: 30},
        {nid: 4, name: 'USA',roundel: 'usa.png', color: '90,130,50', bank: 42,income: 42},
      ]
      nations.each do |n|
        Game.find_by(uuid: game_uuid).nations.create(n)
      end
    end
end
