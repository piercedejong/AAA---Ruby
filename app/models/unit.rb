class Unit < ApplicationRecord
  belongs_to :game

  default_scope { order(created_at: :asc) }


  protected
    def self.create_1940(game)
      units = [
        {uid: 0, name: 'Infantry', special:'Combined Arms - attack at a 2 when paired with artillery', attack: 1, defense: 2, movement: 1, cost: 3, count: 0},
        {uid: 1, name: 'Mechanized Infantry', special: 'Combined Arms - attack at a 2 when paired with artillery', attack: 1, defense: 2, movement: 2, cost: 4, count: 0},
        {uid: 2, name: 'Artillery', special: 'Combined Arms - increases attack of infantry to 2 on a 1 to 1 scale', attack: 2, defense: 2, movement: 1, cost: 4, count: 0},
        {uid: 3, name: 'Tank', special: 'Blitz - attack through unoccupied enenmy territory', attack: 3, defense: 3, movement: 2, cost: 6, count: 0},
        {uid: 4, name: 'Antiaircraft Artillery', special: 'Air Defense - Fire at up to 3 enemy aircraft', attack: 0, defense: 1, movement: 1, cost: 5, count: 0},
        {uid: 5, name: 'Fighter', special: 'Escort and Intercept, Can hit sumbarines when combined with a destroyer', attack: 3, defense: 4, movement: 4, cost: 10, count: 0},
        {uid: 6, name: 'Tactical Bomber', special: 'Tactical Bombing Raid, Can hit sumbarines when combined with a destroyer', attack: 3, defense: 3, movement: 5, cost: 11, count: 0},
        {uid: 7, name: 'Strategic Bomber', special: 'Strategic Bombing Raid, Can hit sumbarines when combined with a destroyer', attack: 4, defense: 1, movement: 6, cost: 12, count: 0},
        {uid: 8, name: 'Submarine', special: 'Suprise Attack, Can\'t hit air units', attack: 2, defense: 1, movement: 2, cost: 6, count: 0},
        {uid: 9, name: 'Transport', special: 'Carry Land Units - 1 infantry plus one of any other land unit', attack: 0, defense: 1, movement: 2, cost: 7, count: 0},
        {uid: 10, name: 'Destroyer', special: 'Anti-Submarine Vessel', attack: 2, defense: 2, movement: 2, cost: 8, count: 0},
        {uid: 11, name: 'Cruiser', special: 'Offshore Bombardment', attack: 3, defense: 3, movement: 2, cost: 12, count: 0},
        {uid: 12, name: 'Aircraft Carrier', special: 'Capital Ship', attack: 0, defense: 2, movement: 2, cost: 16, count: 0},
        {uid: 13, name: 'Battleship', special: 'Capital Ship, Offshore Bombardment', attack: 4, defense: 4, movement: 2, cost: 20, count: 0},
        {uid: 14, name: 'Minor Factory', special: 'Mobalize up to 3 units, must be placed on territory of +2IPC, 6 damage max', attack: 0, defense: 1, movement: 0, cost: 12, count: 0},
        {uid: 15, name: 'Major Factory', special: 'Mobalize up to 10 units, must be placed on territory of +3IPC, 20 damage max', attack: 0, defense: 1, movement: 0, cost: 30, count: 0},
        {uid: 16, name: 'Air Base', special: 'Increased Air Range, Scramble Defense', attack: 0, defense: 1, movement: 0, cost: 15, count: 0},
        {uid: 17, name: 'Naval Base', special: 'Increased Naval Range, Repair Capital Ships', attack: 0, defense: 1, movement: 0, cost: 15, count: 0}
      ]
      units.each do |u|
        game.units.create(u)
      end
    end

    def self.create_1940_Grasshopper(game)
      units = [
        {uid: 0, name: 'Infantry', special:'Combined Arms - attack at a 2 when paired with artillery', attack: 1, defense: 2, movement: 1, cost: 3, count: 0},
        {uid: 1, name: 'Mechanized Infantry', special: 'Combined Arms - attack at a 2 when paired with artillery', attack: 1, defense: 2, movement: 2, cost: 4, count: 0},
        {uid: 2, name: 'Artillery', special: 'Combined Arms - increases attack of nfantry to 2 on a 1 to 1 scale', attack: 2, defense: 2, movement: 1, cost: 4, count: 0},
        {uid: 3, name: 'Tank', special: 'Blitz - move through an unoccupoed enemny territory to attack another', attack: 3, defense: 3, movement: 2, cost: 7, count: 0},
        {uid: 4, name: 'Antiaircraft Artillery', special: 'Air Defense - Fire at up to 3 enemy aircraft', attack: 0, defense: 1, movement: 1, cost: 5, count: 0},
        {uid: 5, name: 'Fighter', special: 'Escort and Intercept, Can hit sumbarines when combined with a destroyer', attack: 3, defense: 3, movement: 4, cost: 10, count: 0},
        {uid: 6, name: 'Tactical Bomber', special: 'Tactical Bombing Raid, Can hit sumbarines when combined with a destroyer', attack: 3, defense: 2, movement: 4, cost: 11, count: 0},
        {uid: 7, name: 'Strategic Bomber', special: 'Strategic Bombing Raid, Can hit sumbarines when combined with a destroyer', attack: 4, defense: 1, movement: 6, cost: 12, count: 0},
        {uid: 8, name: 'Submarine', special: 'Suprise Attack, Can\'t hit air units', attack: 2, defense: 1, movement: 2, cost: 5, count: 0},
        {uid: 9, name: 'Transport', special: 'Carry Land Units - 1 infantry plus one of any other land unit', attack: 0, defense: 1, movement: 2, cost: 8, count: 0},
        {uid: 10, name: 'Destroyer', special: 'Anti-Submarine Vessel', attack: 2, defense: 2, movement: 2, cost: 8, count: 0},
        {uid: 11, name: 'Cruiser', special: 'Offshore Bombardment', attack: 3, defense: 3, movement: 2, cost: 13, count: 0},
        {uid: 12, name: 'Aircraft Carrier', special: 'Capital Ship', attack: 0, defense: 2, movement: 2, cost: 18, count: 0},
        {uid: 13, name: 'Battleship', special: 'Capital Ship, Offshore Bombardment', attack: 4, defense: 4, movement: 2, cost: 21, count: 0},
        {uid: 14, name: 'Minor Factory', special: 'Mobalize up to 3 units, must be placed on territory of +2IPC, 6 damage max', attack: 0, defense: 1, movement: 0, cost: 12, count: 0},
        {uid: 15, name: 'Major Factory', special: 'Mobalize up to 10 units, must be placed on territory of +3IPC, 20 damage max', attack: 0, defense: 1, movement: 0, cost: 30, count: 0},
        {uid: 16, name: 'Air Base', special: 'Increased Air Range, Scramble Defense', attack: 0, defense: 1, movement: 0, cost: 15, count: 0},
        {uid: 17, name: 'Naval Base', special: 'Increased Naval Range, Repair Capital Ships', attack: 0, defense: 1, movement: 0, cost: 15, count: 0}
      ]
      units.each do |u|
        game.units.create(u)
      end
    end

    def self.create_1942(game)
      units = [
        {uid: 0, name: 'Infantry', special:'Combined Arms - attack at a 2 when paired with artillery', attack: 1, defense: 2, movement: 1, cost: 3, count: 0},
        {uid: 1, name: 'Artillery', special: 'Combined Arms - increases attack of nfantry to 2 on a 1 to 1 scale', attack: 2, defense: 2, movement: 1, cost: 4, count: 0},
        {uid: 2, name: 'Tank', special: 'Blitz - move through an unoccupoed enemny territory to attack another', attack: 3, defense: 3, movement: 2, cost: 6, count: 0},
        {uid: 3, name: 'Antiaircraft Artillery', special: 'Air Defense - Fire at up to 3 enemy aircraft', attack: 0, defense: 1, movement: 1, cost: 5, count: 0},
        {uid: 4, name: 'Fighter', special: 'Escort and Intercept, Can hit sumbarines when combined with a destroyer', attack: 3, defense: 4, movement: 4, cost: 10, count: 0},
        {uid: 5, name: 'Strategic Bomber', special: 'Strategic Bombing Raid, Can hit sumbarines when combined with a destroyer', attack: 4, defense: 1, movement: 6, cost: 12, count: 0},
        {uid: 6, name: 'Submarine', special: 'Suprise Attack, Can\'t hit air units', attack: 2, defense: 1, movement: 2, cost: 6, count: 0},
        {uid: 7, name: 'Transport', special: 'Carry Land Units - 1 infantry plus one of any other land unit', attack: 0, defense: 1, movement: 2, cost: 7, count: 0},
        {uid: 8, name: 'Destroyer', special: 'Anti-Submarine Vessel', attack: 2, defense: 2, movement: 2, cost: 8, count: 0},
        {uid: 9, name: 'Cruiser', special: 'Offshore Bombardment', attack: 3, defense: 3, movement: 2, cost: 12, count: 0},
        {uid: 10, name: 'Aircraft Carrier', special: 'Capital Ship', attack: 0, defense: 2, movement: 2, cost: 16, count: 0},
        {uid: 11, name: 'Battleship', special: 'Capital Ship, Offshore Bombardment', attack: 4, defense: 4, movement: 2, cost: 20, count: 0},
        {uid: 12, name: 'Minor Factory', special: 'Mobalize up to 3 units, must be placed on territory of +2IPC, 6 damage max', attack: 0, defense: 1, movement: 0, cost: 12, count: 0},
        {uid: 13, name: 'Major Factory', special: 'Mobalize up to 10 units, must be placed on territory of +3IPC, 20 damage max', attack: 0, defense: 1, movement: 0, cost: 30, count: 0},
      ]
      units.each do |u|
        game.units.create(u)
      end
    end

    def self.create_1914(game)
      units = [
        {uid: 0, name: 'Infantry', special:'',    attack: 1, defense: 2, movement: 1, cost: 3, count: 0},
        {uid: 1, name: 'Artillery', special: '',  attack: 2, defense: 2, movement: 1, cost: 4, count: 0},
        {uid: 2, name: 'Tank', special: '',       attack: 3, defense: 3, movement: 2, cost: 6, count: 0},
        {uid: 3, name: 'Fighter', special: '',    attack: 3, defense: 4, movement: 4, cost: 6, count: 0},
        {uid: 4, name: 'Battleship', special: '', attack: 4, defense: 4, movement: 2, cost: 12, count: 0},
        {uid: 5, name: 'Cruiser', special: '',    attack: 3, defense: 3, movement: 2, cost: 9, count: 0},
        {uid: 6, name: 'Submarine', special: '',  attack: 2, defense: 2, movement: 2, cost: 6, count: 0},
        {uid: 7, name: 'Transport', special: '',  attack: 0, defense: 0, movement: 2, cost: 6, count: 0},
        ]
      units.each do |u|
        game.units.create(u)
      end
    end
end
