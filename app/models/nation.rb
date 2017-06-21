class Nation < ApplicationRecord
  belongs_to :game


  protected
    def self.create_1940(game_uuid)
      nations = [
        {name: 'Germany',roundel: 'germany.png', color: 'black', bank: 30,income: 30},
        {name: 'USSR',roundel: 'ussr.png', color: 'maroon', bank: 37,income: 37},
        {name: 'Japan',roundel: 'japan.png', color: 'orange', bank: 26,income: 26},
        {name: 'USA',roundel: 'usa.png', color: 'green', bank: 52,income: 52},
        {name: 'China',roundel: 'china.png', color: 'lime green', bank: 12,income: 12},
        {name: 'Britain',roundel: 'britain.png', color: 'beige', bank: 28,income: 28},
        {name: 'Pacific',roundel: 'pacific.png', color: 'beige', bank: 17,income: 17},
        {name: 'Italy',roundel: 'italy.png', color: 'brown', bank: 10,income: 10},
        {name: 'ANZAC',roundel: 'anzac.png', color: 'gray', bank: 10,income: 10},
        {name: 'France',roundel: 'france.png', color: 'blue', bank: 19,income: 19},
      ]
      nations.each do |n|
        Game.find_by(uuid: game_uuid).nations.create(n)
      end
    end

    def self.create_1942(game_uuid)
      nations = [
        {name: 'USSR',roundel: 'ussr.png', color: 'maroon', bank: 24,income: 24},
        {name: 'Germany',roundel: 'germany.png', color: 'black', bank: 41,income: 41},
        {name: 'United Kingdom',roundel: 'britain.png', color: 'beige', bank: 31,income: 31},
        {name: 'Japan',roundel: 'japan.png', color: 'orange', bank: 30,income: 30},
        {name: 'USA',roundel: 'usa.png', color: 'green', bank: 42,income: 42},
      ]
      nations.each do |n|
        Game.find_by(uuid: game_uuid).nations.create(n)
      end
    end
end
