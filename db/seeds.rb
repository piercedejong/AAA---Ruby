# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
units1940 = [
  {name: 'Infantry', special:'Attack at a 2 with artillery support', attack: 1, defense: 2, movement: 1, cost: 3, count: 0},
  {name: 'Mobile Infantry', special: 'Attack at a 2 with artillery support', attack: 1, defense: 2, movement: 2, cost: 4, count: 0},
  {name: 'Artillery', special: 'Each artillery can boost attack of one infantry unit by 1', attack: 2, defense: 2, movement: 1, cost: 4, count: 0},
  {name: 'Tank', special: 'Can blitz through an enemy territory', attack: 3, defense: 3, movement: 2, cost: 6, count: 0},
  {name: 'Antitank Artillery', special: 'When a 1 is rolled, enemy tanks are hit first', attack: 1, defense: 3, movement: 1, cost: 6, count: 0},
  {name: 'Antiaircraft Artillery', special: 'Roll up to 3 dice against enemy aircraft', attack: 0, defense: 1, movement: 1, cost: 5, count: 0},
  {name: 'Fighter', special: '', attack: 3, defense: 4, movement: 4, cost: 10, count: 0},
  {name: 'Tactical Bomber', special: '', attack: 3, defense: 3, movement: 5, cost: 11, count: 0},
  {name: 'Strategic Bomber', special: 'Can do ', attack: 4, defense: 1, movement: 6, cost: 12, count: 0},
  {name: 'Submarine', special: 'Suprise Attack', attack: 2, defense: 1, movement: 2, cost: 6, count: 0},
  {name: 'Destroyer', special: '', attack: 2, defense: 2, movement: 2, cost: 6, count: 0},
  {name: 'Transport', special: '', attack: 0, defense: 1, movement: 2, cost: 6, count: 0},
  {name: 'Cruiser', special: 'Can do naval bombardment', attack: 3, defense: 3, movement: 2, cost: 12, count: 0},
  {name: 'Aircraft Carrier', special: 'Takes 2 hits to sink', attack: 0, defense: 2, movement: 2, cost: 16, count: 0},
  {name: 'Battleship', special: 'Takes 2 hits to sink. Can do naval bombardment', attack: 4, defense: 4, movement: 2, cost: 20, count: 0},
  {name: 'Minor Factory', special: '', attack: 0, defense: 0, movement: 0, cost: 10, count: 0},
  {name: 'Major Factory', special: '', attack: 0, defense: 0, movement: 0, cost: 20, count: 0},
  {name: 'Industrial Complex', special: '', attack: 0, defense: 0, movement: 0, cost: 30, count: 0}
]

nations1940 = [
  {name: 'Germany',roundel: '', color: 'black', bank: 30,income: 30},
  {name: 'USSR',roundel: '', color: 'maroon', bank: 37,income: 37},
  {name: 'Japan',roundel: '', color: 'orange', bank: 26,income: 26},
  {name: 'USA',roundel: '', color: 'green', bank: 52,income: 52},
  {name: 'China',roundel: '', color: 'lime green', bank: 12,income: 12},
  {name: 'Britain',roundel: '', color: 'beige', bank: 28,income: 28},
  {name: 'Pacific',roundel: '', color: 'beige', bank: 17,income: 17},
  {name: 'Italy',roundel: '', color: 'brown', bank: 10,income: 10},
  {name: 'ANZAC',roundel: '', color: 'gray', bank: 10,income: 10},
  {name: 'France',roundel: '', color: 'blue', bank: 19,income: 19},
]

units1942 = [
  {name: 'Infantry', special:'Attack at a 2 with artillery support', attack: 1, defense: 2, movement: 1, cost: 3, count: 0},
  {name: 'Artillery', special: 'Each artillery can boost attack of one infantry unit by 1', attack: 2, defense: 2, movement: 1, cost: 4, count: 0},
  {name: 'Tank', special: 'Can blitz through an enemy territory', attack: 3, defense: 3, movement: 2, cost: 6, count: 0},
  {name: 'Antiaircraft Artillery', special: '', attack: 0, defense: 1, movement: 1, cost: 5, count: 0},
  {name: 'Fighter', special: '', attack: 3, defense: 4, movement: 4, cost: 10, count: 0},
  {name: 'Strategic Bomber', special: '', attack: 4, defense: 1, movement: 6, cost: 12, count: 0},
  {name: 'Submarine', special: 'Suprise Attack', attack: 2, defense: 1, movement: 2, cost: 6, count: 0},
  {name: 'Destroyer', special: '', attack: 2, defense: 2, movement: 2, cost: 6, count: 0},
  {name: 'Transport', special: '', attack: 0, defense: 1, movement: 2, cost: 6, count: 0},
  {name: 'Cruiser', special: 'Can do naval bombardment', attack: 3, defense: 3, movement: 2, cost: 12, count: 0},
  {name: 'Aircraft Carrier', special: 'Takes 2 hits to sink', attack: 0, defense: 2, movement: 2, cost: 16, count: 0},
  {name: 'Battleship', special: 'Takes 2 hits to sink. Can do naval bombardment', attack: 4, defense: 4, movement: 2, cost: 20, count: 0},
  {name: 'Minor Factory', special: '', attack: 0, defense: 0, movement: 0, cost: 10, count: 0},
  {name: 'Major Factory', special: '', attack: 0, defense: 0, movement: 0, cost: 20, count: 0},
]

nations1942 = [

  {name: 'USSR',roundel: '', color: 'maroon', bank: 24,income: 24},
  {name: 'Germany',roundel: '', color: 'black', bank: 40,income: 40},
  {name: 'United Kingdom',roundel: '', color: 'beige', bank: 28,income: 28},
  {name: 'Japan',roundel: '', color: 'orange', bank: 30,income: 30},
  {name: 'USA',roundel: '', color: 'green', bank: 42,income: 42},
]

games = [
  {name: 'Global 1940', current: 1, round: 1},
  {name: '1942 Second Edition', current: 1, round: 1},
]

games.each do |g|
  instance = Game.find_by(name: g[:name])
  Game.create(g) if instance.nil?
end

nations1940.each do |n|
  Game.find_by(name: 'Global 1940').nations.create(n)
end

units1940.each do |u|
  Game.find_by(name: 'Global 1940').units.create(u)
end

nations1942.each do |n|
  Game.find_by(name: '1942 Second Edition').nations.create(n)
end

units1942.each do |u|
  Game.find_by(name: '1942 Second Edition').units.create(u)
end
