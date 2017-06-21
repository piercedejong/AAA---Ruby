class Unit < ApplicationRecord
  belongs_to :game


  protected
    def self.create_1940(game_uuid)
      units = [
        {name: 'Infantry', special:'Combined Arms - attack at a 2 when paired with artillery', attack: 1, defense: 2, movement: 1, cost: 3, count: 0},
        {name: 'Mechanized Infantry', special: 'Combined Arms - attack at a 2 when paired with artillery', attack: 1, defense: 2, movement: 2, cost: 4, count: 0},
        {name: 'Artillery', special: 'Combined Arms - increases attack of nfantry to 2 on a 1 to 1 scale', attack: 2, defense: 2, movement: 1, cost: 4, count: 0},
        {name: 'Tank', special: 'Blitz - move through an unoccupoed enemny territory to attack another', attack: 3, defense: 3, movement: 2, cost: 6, count: 0},
        {name: 'Antiaircraft Artillery', special: 'Air Defense - Fire at up to 3 enemy aircraft', attack: 0, defense: 1, movement: 1, cost: 5, count: 0},
        {name: 'Fighter', special: 'Escort and Intercept, Can hit sumbarines when combined with a destroyer', attack: 3, defense: 4, movement: 4, cost: 10, count: 0},
        {name: 'Tactical Bomber', special: 'Tactical Bombing Raid, Can hit sumbarines when combined with a destroyer', attack: 3, defense: 3, movement: 5, cost: 11, count: 0},
        {name: 'Strategic Bomber', special: 'Strategic Bombing Raid, Can hit sumbarines when combined with a destroyer', attack: 4, defense: 1, movement: 6, cost: 12, count: 0},
        {name: 'Submarine', special: 'Suprise Attack, Can\'t hit air units', attack: 2, defense: 1, movement: 2, cost: 6, count: 0},
        {name: 'Transport', special: 'Carry Land Units - 1 infantry plus one of any other land unit', attack: 0, defense: 1, movement: 2, cost: 7, count: 0},
        {name: 'Destroyer', special: 'Anti-Submarine Vessel', attack: 2, defense: 2, movement: 2, cost: 8, count: 0},
        {name: 'Cruiser', special: 'Offshore Bombardment', attack: 3, defense: 3, movement: 2, cost: 12, count: 0},
        {name: 'Aircraft Carrier', special: 'Capital Ship', attack: 0, defense: 2, movement: 2, cost: 16, count: 0},
        {name: 'Battleship', special: 'Capital Ship, Offshore Bombardment', attack: 4, defense: 4, movement: 2, cost: 20, count: 0},
        {name: 'Minor Factory', special: 'Mobalize up to 3 units, must be placed on territory of +2IPC, 6 damage max', attack: 0, defense: 1, movement: 0, cost: 12, count: 0},
        {name: 'Major Factory', special: 'Mobalize up to 10 units, must be placed on territory of +3IPC, 20 damage max', attack: 0, defense: 1, movement: 0, cost: 30, count: 0},
        {name: 'Air Base', special: 'Increased Air Range, Scramble Defense', attack: 0, defense: 1, movement: 0, cost: 15, count: 0},
        {name: 'Naval Base', special: 'Increased Naval Range, Repair Capital Ships', attack: 0, defense: 1, movement: 0, cost: 15, count: 0}
      ]
      units.each do |u|
        Game.find_by(uuid: game_uuid).units.create(u)
      end
    end

    def self.create_1942(game_uuid)
      units = [
        {name: 'Infantry', special:'Combined Arms - attack at a 2 when paired with artillery', attack: 1, defense: 2, movement: 1, cost: 3, count: 0},
        {name: 'Artillery', special: 'Combined Arms - increases attack of nfantry to 2 on a 1 to 1 scale', attack: 2, defense: 2, movement: 1, cost: 4, count: 0},
        {name: 'Tank', special: 'Blitz - move through an unoccupoed enemny territory to attack another', attack: 3, defense: 3, movement: 2, cost: 6, count: 0},
        {name: 'Antiaircraft Artillery', special: 'Air Defense - Fire at up to 3 enemy aircraft', attack: 0, defense: 1, movement: 1, cost: 5, count: 0},
        {name: 'Fighter', special: 'Escort and Intercept, Can hit sumbarines when combined with a destroyer', attack: 3, defense: 4, movement: 4, cost: 10, count: 0},
        {name: 'Strategic Bomber', special: 'Strategic Bombing Raid, Can hit sumbarines when combined with a destroyer', attack: 4, defense: 1, movement: 6, cost: 12, count: 0},
        {name: 'Submarine', special: 'Suprise Attack, Can\'t hit air units', attack: 2, defense: 1, movement: 2, cost: 6, count: 0},
        {name: 'Transport', special: 'Carry Land Units - 1 infantry plus one of any other land unit', attack: 0, defense: 1, movement: 2, cost: 7, count: 0},
        {name: 'Destroyer', special: 'Anti-Submarine Vessel', attack: 2, defense: 2, movement: 2, cost: 8, count: 0},
        {name: 'Cruiser', special: 'Offshore Bombardment', attack: 3, defense: 3, movement: 2, cost: 12, count: 0},
        {name: 'Aircraft Carrier', special: 'Capital Ship', attack: 0, defense: 2, movement: 2, cost: 16, count: 0},
        {name: 'Battleship', special: 'Capital Ship, Offshore Bombardment', attack: 4, defense: 4, movement: 2, cost: 20, count: 0},
        {name: 'Minor Factory', special: 'Mobalize up to 3 units, must be placed on territory of +2IPC, 6 damage max', attack: 0, defense: 1, movement: 0, cost: 12, count: 0},
        {name: 'Major Factory', special: 'Mobalize up to 10 units, must be placed on territory of +3IPC, 20 damage max', attack: 0, defense: 1, movement: 0, cost: 30, count: 0},
      ]
      units.each do |u|
        Game.find_by(uuid: game_uuid).units.create(u)
      end
    end
end
