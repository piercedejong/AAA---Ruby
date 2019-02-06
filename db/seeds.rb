# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Victory.all.each do |v| v.destroy end
Research.all.each do |r| r.destroy end
Objectives.all.each do |o| o.destroy end
Specials.all.each do |u| u.destroy end
Units.all.each do |u| u.destroy end
Nations.all.each do |n| n.destroy end
Game.all.each do |g| g.destroy end
