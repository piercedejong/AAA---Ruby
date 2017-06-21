# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

units = [
  {game_name: "Global 1940", name: 'Infantry', special:'Combined Arms - attack at a 2 when paired with artillery', attack: 1, defense: 2, movement: 1, cost: 3, count: 0},
  {game_name: "Global 1940", name: 'Mechanized Infantry', special: 'Combined Arms - attack at a 2 when paired with artillery', attack: 1, defense: 2, movement: 2, cost: 4, count: 0},
  {game_name: "Global 1940", name: 'Artillery', special: 'Combined Arms - increases attack of nfantry to 2 on a 1 to 1 scale', attack: 2, defense: 2, movement: 1, cost: 4, count: 0},
  {game_name: "Global 1940", name: 'Tank', special: 'Blitz - move through an unoccupoed enemny territory to attack another', attack: 3, defense: 3, movement: 2, cost: 6, count: 0},
  {game_name: "Global 1940", name: 'Antiaircraft Artillery', special: 'Air Defense - Fire at up to 3 enemy aircraft', attack: 0, defense: 1, movement: 1, cost: 5, count: 0},
  {game_name: "Global 1940", name: 'Fighter', special: 'Escort and Intercept, Can hit sumbarines when combined with a destroyer', attack: 3, defense: 4, movement: 4, cost: 10, count: 0},
  {game_name: "Global 1940", name: 'Tactical Bomber', special: 'Tactical Bombing Raid, Can hit sumbarines when combined with a destroyer', attack: 3, defense: 3, movement: 5, cost: 11, count: 0},
  {game_name: "Global 1940", name: 'Strategic Bomber', special: 'Strategic Bombing Raid, Can hit sumbarines when combined with a destroyer', attack: 4, defense: 1, movement: 6, cost: 12, count: 0},
  {game_name: "Global 1940", name: 'Submarine', special: 'Suprise Attack, Can\'t hit air units', attack: 2, defense: 1, movement: 2, cost: 6, count: 0},
  {game_name: "Global 1940", name: 'Transport', special: 'Carry Land Units - 1 infantry plus one of any other land unit', attack: 0, defense: 1, movement: 2, cost: 7, count: 0},
  {game_name: "Global 1940", name: 'Destroyer', special: 'Anti-Submarine Vessel', attack: 2, defense: 2, movement: 2, cost: 8, count: 0},
  {game_name: "Global 1940", name: 'Cruiser', special: 'Offshore Bombardment', attack: 3, defense: 3, movement: 2, cost: 12, count: 0},
  {game_name: "Global 1940", name: 'Aircraft Carrier', special: 'Capital Ship', attack: 0, defense: 2, movement: 2, cost: 16, count: 0},
  {game_name: "Global 1940", name: 'Battleship', special: 'Capital Ship, Offshore Bombardment', attack: 4, defense: 4, movement: 2, cost: 20, count: 0},
  {game_name: "Global 1940", name: 'Minor Factory', special: 'Mobalize up to 3 units, must be placed on territory of +2IPC, 6 damage max', attack: 0, defense: 1, movement: 0, cost: 12, count: 0},
  {game_name: "Global 1940", name: 'Major Factory', special: 'Mobalize up to 10 units, must be placed on territory of +3IPC, 20 damage max', attack: 0, defense: 1, movement: 0, cost: 30, count: 0},
  {game_name: "Global 1940", name: 'Air Base', special: 'Increased Air Range, Scramble Defense', attack: 0, defense: 1, movement: 0, cost: 15, count: 0},
  {game_name: "Global 1940", name: 'Naval Base', special: 'Increased Naval Range, Repair Capital Ships', attack: 0, defense: 1, movement: 0, cost: 15, count: 0}
]

nations = [
  {game_name: ["Global 1940", ""].to_json, name: 'Germany',roundel: 'germany.png', color: 'black', bank: 30,income: 30},
  {game_name: "Global 1940", name: 'USSR',roundel: 'ussr.png', color: 'maroon', bank: 37,income: 37},
  {game_name: "Global 1940", name: 'Japan',roundel: 'japan.png', color: 'orange', bank: 26,income: 26},
  {game_name: "Global 1940", name: 'USA',roundel: 'usa.png', color: 'green', bank: 52,income: 52},
  {game_name: "Global 1940", name: 'China',roundel: 'china.png', color: 'lime green', bank: 12,income: 12},
  {game_name: "Global 1940", name: 'Britain',roundel: 'britain.png', color: 'beige', bank: 28,income: 28},
  {game_name: "Global 1940", name: 'Pacific',roundel: 'pacific.png', color: 'beige', bank: 17,income: 17},
  {game_name: "Global 1940", name: 'Italy',roundel: 'italy.png', color: 'brown', bank: 10,income: 10},
  {game_name: "Global 1940", name: 'ANZAC',roundel: 'anzac.png', color: 'gray', bank: 10,income: 10},
  {game_name: "Global 1940", name: 'France',roundel: 'france.png', color: 'blue', bank: 19,income: 19},
]

#games.each do |g|
#  instance = Game.find_by(name: g[:name])
#  Game.create(g) if instance.nil?
#end

nations.each do |n|
  instance = Nation
  nations.create(n)
end

units1940.each do |u|
  units.create(u)
end

#nations1942.each do |n|
#  Game.find_by(name: '1942 Second Edition').nations.create(n)
#end

#units1942.each do |u|
#  Game.find_by(name: '1942 Second Edition').units.create(u)
#end
