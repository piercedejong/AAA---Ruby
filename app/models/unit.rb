class Unit < ApplicationRecord
  before_create :create_uuid
  belongs_to :game
  belongs_to :team

  default_scope { order(created_at: :asc) }

  def specials
    @search = self.game.game_name
    @name = self.name
    if @search.include?"House"
      return Special.where(game: "House").where("unit_name like ?", "#{@name}")
    elsif @search.include?"1940"
      return Special.where(game: "1940").where("unit_name like ?", "#{@name}")
    elsif @search.include?"1914"
      return Special.where(game: "1940").where("unit_name like ?", "#{@name}")
    elsif @search.include?"1942"
      return Special.where(game: "1942").where("unit_name like ?", "#{@name}")
    end
  end

  def next
    self.class.where("priority > ?", priority).first
  end

  protected
    def self.create_1940(game)
      units = [
        {uid: 0, name: 'Infantry',              special: 'inf', attack: 1, defense: 2, movement: 1, cost: 3, count: 0},
        {uid: 1, name: 'Mechanized Infantry',   special: 'mec', attack: 1, defense: 2, movement: 2, cost: 4, count: 0},
        {uid: 2, name: 'Artillery',             special: 'art', attack: 2, defense: 2, movement: 1, cost: 4, count: 0},
        {uid: 3, name: 'Tank',                  special: 'tnk', attack: 3, defense: 3, movement: 2, cost: 6, count: 0},
        {uid: 4, name: 'Antiaircraft Artillery',special: 'aaa', attack: 0, defense: 1, movement: 1, cost: 5, count: 0},
        {uid: 5, name: 'Fighter',               special: 'fgh', attack: 3, defense: 4, movement: 4, cost: 10, count: 0},
        {uid: 6, name: 'Tactical Bomber',       special: 'tac', attack: 3, defense: 3, movement: 4, cost: 11, count: 0},
        {uid: 7, name: 'Strategic Bomber',      special: 'str', attack: 4, defense: 1, movement: 5, cost: 12, count: 0},
        {uid: 8, name: 'Submarine',             special: 'sub', attack: 2, defense: 1, movement: 2, cost: 6, count: 0},
        {uid: 9, name: 'Transport',             special: 'tnt', attack: 0, defense: 1, movement: 2, cost: 7, count: 0},
        {uid: 10, name: 'Destroyer',            special: 'dst', attack: 2, defense: 2, movement: 2, cost: 8, count: 0},
        {uid: 11, name: 'Cruiser',              special: 'crs', attack: 3, defense: 3, movement: 2, cost: 12, count: 0},
        {uid: 12, name: 'Aircraft Carrier',     special: 'car', attack: 0, defense: 2, movement: 2, cost: 16, count: 0},
        {uid: 13, name: 'Battleship',           special: 'btl', attack: 4, defense: 4, movement: 2, cost: 20, count: 0},
        {uid: 14, name: 'Minor Factory',        special: 'min', attack: 0, defense: 1, movement: 0, cost: 12, count: 0},
        {uid: 15, name: 'Major Factory',        special: 'maj', attack: 0, defense: 1, movement: 0, cost: 30, count: 0},
        {uid: 16, name: 'Air Base',             special: 'air', attack: 0, defense: 1, movement: 0, cost: 15, count: 0},
        {uid: 17, name: 'Naval Base',           special: 'nvl', attack: 0, defense: 1, movement: 0, cost: 15, count: 0}
      ]
      units.each do |u|
        game.units.create(u)
      end
    end

    def self.create_1940_house(game)
      units = [
        {uid: 0, name: 'Infantry',              special: 'inf', attack: 1, defense: 2, movement: 1, cost: 3, count: 0},
        {uid: 1, name: 'Mechanized Infantry',   special: 'mec', attack: 1, defense: 2, movement: 2, cost: 4, count: 0},
        {uid: 2, name: 'Artillery',             special: 'art', attack: 2, defense: 2, movement: 1, cost: 4, count: 0},
        {uid: 3, name: 'Tank',                  special: 'tnk', attack: 3, defense: 3, movement: 2, cost: 6, count: 0},
        {uid: 4, name: 'Antiaircraft Artillery',special: 'aaa', attack: 0, defense: 1, movement: 1, cost: 5, count: 0},
        {uid: 5, name: 'Fighter',               special: 'fgh', attack: 3, defense: 4, movement: 4, cost: 10, count: 0},
        {uid: 6, name: 'Tactical Bomber',       special: 'tac', attack: 3, defense: 3, movement: 4, cost: 11, count: 0},
        {uid: 7, name: 'Strategic Bomber',      special: 'str', attack: 4, defense: 1, movement: 5, cost: 12, count: 0},
        {uid: 8, name: 'Submarine',             special: 'sub', attack: 2, defense: 1, movement: 2, cost: 6, count: 0},
        {uid: 9, name: 'Transport',             special: 'tnt', attack: 0, defense: 1, movement: 2, cost: 7, count: 0},
        {uid: 10, name: 'Destroyer',            special: 'dst', attack: 2, defense: 2, movement: 2, cost: 8, count: 0},
        {uid: 11, name: 'Cruiser',              special: 'crs', attack: 3, defense: 3, movement: 2, cost: 12, count: 0},
        {uid: 12, name: 'Aircraft Carrier',     special: 'car', attack: 0, defense: 2, movement: 2, cost: 16, count: 0},
        {uid: 13, name: 'Battleship',           special: 'btl', attack: 4, defense: 4, movement: 2, cost: 20, count: 0},
        {uid: 14, name: 'Minor Factory',        special: 'min', attack: 0, defense: 1, movement: 0, cost: 12, count: 0},
        {uid: 15, name: 'Major Factory',        special: 'maj', attack: 0, defense: 1, movement: 0, cost: 30, count: 0},
        {uid: 16, name: 'Air Base',             special: 'air', attack: 0, defense: 1, movement: 0, cost: 15, count: 0},
        {uid: 17, name: 'Naval Base',           special: 'nvl', attack: 0, defense: 1, movement: 0, cost: 15, count: 0}
      ]
      units.each do |u|
        game.units.create(u)
      end
    end

    def self.create_1942(game)
      units = [
        {uid: 0, name: 'Infantry',              special: '', attack: 1, defense: 2, movement: 1, cost: 3, count: 0},
        {uid: 1, name: 'Artillery',             special: '', attack: 2, defense: 2, movement: 1, cost: 4, count: 0},
        {uid: 2, name: 'Tank',                  special: '', attack: 3, defense: 3, movement: 2, cost: 6, count: 0},
        {uid: 3, name: 'Antiaircraft Artillery',special: '', attack: 0, defense: 1, movement: 1, cost: 5, count: 0},
        {uid: 4, name: 'Fighter',               special: '', attack: 3, defense: 4, movement: 4, cost: 10, count: 0},
        {uid: 5, name: 'Strategic Bomber',      special: '', attack: 4, defense: 1, movement: 6, cost: 12, count: 0},
        {uid: 6, name: 'Submarine',             special: '', attack: 2, defense: 1, movement: 2, cost: 6, count: 0},
        {uid: 7, name: 'Transport',             special: '', attack: 0, defense: 1, movement: 2, cost: 7, count: 0},
        {uid: 8, name: 'Destroyer',             special: '', attack: 2, defense: 2, movement: 2, cost: 8, count: 0},
        {uid: 9, name: 'Cruiser',               special: '', attack: 3, defense: 3, movement: 2, cost: 12, count: 0},
        {uid: 10, name: 'Aircraft Carrier',     special: '', attack: 0, defense: 2, movement: 2, cost: 16, count: 0},
        {uid: 11, name: 'Battleship',           special: '', attack: 4, defense: 4, movement: 2, cost: 20, count: 0},
        {uid: 12, name: 'Minor Factory',        special: '', attack: 0, defense: 1, movement: 0, cost: 12, count: 0},
        {uid: 13, name: 'Major Factory',        special: '', attack: 0, defense: 1, movement: 0, cost: 30, count: 0},
      ]
      units.each do |u|
        game.units.create(u)
      end
    end

    def self.create_1914(game)
      units = [
        {uid: 0, name: 'Infantry',  special: '', attack: 1, defense: 2, movement: 1, cost: 3, count: 0},
        {uid: 1, name: 'Artillery', special: '', attack: 2, defense: 2, movement: 1, cost: 4, count: 0},
        {uid: 2, name: 'Tank',      special: '', attack: 3, defense: 3, movement: 2, cost: 6, count: 0},
        {uid: 3, name: 'Fighter',   special: '', attack: 3, defense: 4, movement: 4, cost: 6, count: 0},
        {uid: 4, name: 'Battleship',special: '', attack: 4, defense: 4, movement: 2, cost: 12, count: 0},
        {uid: 5, name: 'Cruiser',   special: '', attack: 3, defense: 3, movement: 2, cost: 9, count: 0},
        {uid: 6, name: 'Submarine', special: '', attack: 2, defense: 2, movement: 2, cost: 6, count: 0},
        {uid: 7, name: 'Transport', special: '', attack: 0, defense: 0, movement: 2, cost: 6, count: 0},
        ]
      units.each do |u|
        game.units.create(u)
      end
    end

    def self.create_1940Land(battleCalculator)
      units = [
        {uid: 0, name: 'Infantry',              special: 'inf', priority: 1,attack: 1, defense: 2, movement: 1, cost: 3, count: 0},
        {uid: 1, name: 'Mechanized Infantry',   special: 'mec', priority: 2,attack: 1, defense: 2, movement: 2, cost: 4, count: 0},
        {uid: 2, name: 'Artillery',             special: 'art', priority: 3,attack: 2, defense: 2, movement: 1, cost: 4, count: 0},
        {uid: 3, name: 'Tank',                  special: 'tnk', priority: 4,attack: 3, defense: 3, movement: 2, cost: 6, count: 0},
        {uid: 4, name: 'Antiaircraft Artillery',special: 'aaa', priority: 8,attack: 0, defense: 1, movement: 1, cost: 5, count: 0},
        {uid: 5, name: 'Fighter',               special: 'fgh', priority: 6,attack: 3, defense: 4, movement: 4, cost: 10, count: 0},
        {uid: 6, name: 'Tactical Bomber',       special: 'tac', priority: 5,attack: 3, defense: 3, movement: 4, cost: 11, count: 0},
        {uid: 7, name: 'Strategic Bomber',      special: 'str', priority: 7,attack: 4, defense: 1, movement: 5, cost: 12, count: 0},
      ]
      units.each do |u|
        battleCalculator.teams.first.units.create(u)
      end

      units = [
        {uid: 0, name: 'Infantry',              special: 'inf', priority: 2,attack: 1, defense: 2, movement: 1, cost: 3, count: 0},
        {uid: 1, name: 'Mechanized Infantry',   special: 'mec', priority: 3,attack: 1, defense: 2, movement: 2, cost: 4, count: 0},
        {uid: 2, name: 'Artillery',             special: 'art', priority: 4,attack: 2, defense: 2, movement: 1, cost: 4, count: 0},
        {uid: 3, name: 'Tank',                  special: 'tnk', priority: 5,attack: 3, defense: 3, movement: 2, cost: 6, count: 0},
        {uid: 4, name: 'Antiaircraft Artillery',special: 'aaa', priority: 8,attack: 0, defense: 1, movement: 1, cost: 5, count: 0},
        {uid: 5, name: 'Fighter',               special: 'fgh', priority: 7,attack: 3, defense: 4, movement: 4, cost: 10, count: 0},
        {uid: 6, name: 'Tactical Bomber',       special: 'tac', priority: 6,attack: 3, defense: 3, movement: 4, cost: 11, count: 0},
        {uid: 7, name: 'Strategic Bomber',      special: 'str', priority: 1,attack: 4, defense: 1, movement: 5, cost: 12, count: 0},
      ]
      units.each do |u|
        battleCalculator.teams.second.units.create(u)
      end
    end

    def self.create_1940Water(team)
      units = [
        {uid: 1, name: 'Fighter',               special: 'fgh', attack: 3, defense: 4, movement: 4, cost: 10, count: 0},
        {uid: 2, name: 'Tactical Bomber',       special: 'tac', attack: 3, defense: 3, movement: 4, cost: 11, count: 0},
        {uid: 4, name: 'Strategic Bomber',      special: 'str', attack: 4, defense: 1, movement: 5, cost: 12, count: 0},
        {uid: 5, name: 'Submarine',             special: 'sub', attack: 2, defense: 1, movement: 2, cost: 6, count: 0},
        {uid: 6, name: 'Transport',             special: 'tnt', attack: 0, defense: 1, movement: 2, cost: 7, count: 0},
        {uid: 7, name: 'Destroyer',             special: 'dst', attack: 2, defense: 2, movement: 2, cost: 8, count: 0},
        {uid: 8, name: 'Cruiser',               special: 'crs', attack: 3, defense: 3, movement: 2, cost: 12, count: 0},
        {uid: 9, name: 'Aircraft Carrier',      special: 'car', attack: 0, defense: 2, movement: 2, cost: 16, count: 0},
        {uid: 10,name: 'Battleship',            special: 'btl', attack: 4, defense: 4, movement: 2, cost: 20, count: 0},
        ]
      units.each do |u|
        team.units.create(u)
      end
    end

    def self.create_1940Amphibious(team)
      units = [
        {uid: 0, name: 'Infantry',              special: 'inf', attack: 1, defense: 2, movement: 1, cost: 3, count: 0},
        {uid: 1, name: 'Mechanized Infantry',   special: 'mec', attack: 1, defense: 2, movement: 2, cost: 4, count: 0},
        {uid: 2, name: 'Artillery',             special: 'art', attack: 2, defense: 2, movement: 1, cost: 4, count: 0},
        {uid: 3, name: 'Tank',                  special: 'tnk', attack: 3, defense: 3, movement: 2, cost: 6, count: 0},
        {uid: 4, name: 'Antiaircraft Artillery',special: 'aaa', attack: 0, defense: 1, movement: 1, cost: 5, count: 0},
        {uid: 5, name: 'Fighter',               special: 'fgh', attack: 3, defense: 4, movement: 4, cost: 10, count: 0},
        {uid: 6, name: 'Tactical Bomber',       special: 'tac', attack: 3, defense: 3, movement: 4, cost: 11, count: 0},
        {uid: 7, name: 'Strategic Bomber',      special: 'str', attack: 4, defense: 1, movement: 5, cost: 12, count: 0},
        {uid: 8, name: 'Cruiser',               special: 'crs', attack: 3, defense: 3, movement: 2, cost: 12, count: 0},
        {uid: 9,name: 'Battleship',             special: 'btl', attack: 4, defense: 4, movement: 2, cost: 20, count: 0},
      ]
      units.each do |u|
        team.units.create(u)
      end
    end

    private
      def create_uuid
        begin
          self.uuid = SecureRandom.uuid
        end while self.class.exists?(:uuid => uuid)
      end
end
