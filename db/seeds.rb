# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
units = [

  {name: 'Infantry', special:'Attack at a 2 with artillery support', attack: 1, defense: 2, movement: 1, cost: 3, count: 0},
  {name: 'Mobile Infantry', special: '', attack: , defense: , movement: , count: , cost: },
  {name: 'Artillery', special: '', attack: , defense: , movement: , count: , cost: },
  {name: 'Tank', special: '', attack: , defense: , movement: , count: , cost: },
  {name: 'Antitank Artillery', special: '', attack: , defense: , movement: , count: , cost: },
  {name: 'Antiaircraft Artillery', special: '', attack: , defense: , movement: , count: , cost: },
  {name: 'Fighter', special: '', attack: , defense: , movement: , count: , cost: },
  {name: 'Tactical Bomber', special: '', attack: , defense: , movement: , count: , cost: },
  {name: 'Strategic Bomber', special: '', attack: , defense: , movement: , count: , cost: },
  {name: 'Submarine', special: '', attack: , defense: , movement: , count: , cost: },
  {name: 'Destroyer', special: '', attack: , defense: , movement: , count: , cost: },
  {name: 'Cruiser', special: '', attack: , defense: , movement: , count: , cost: },
  {name: 'Aircraft Carrier', special: '', attack: , defense: , movement: , count: , cost: },
  {name: 'Battleship', special: '', attack: , defense: , movement: , count: , cost: },
  {name: 'Minor Factory', special: '', attack: , defense: , movement: , count: , cost: },
  {name: 'Major Factory', special: '', attack: , defense: , movement: , count: , cost: },
  {name: 'Industrial Complex', special: '', attack: , defense: , movement: , count: , cost: },

]

units.each do |u|
    instance = Unit.find_by(name: u[:name])
    # puts "Skipping simulation: #{sim[:short_code]}" if instance.present?
    Unit.create(u) if instance.nil?
end
