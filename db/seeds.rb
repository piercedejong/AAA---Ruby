# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Special.destroy_all

Special.create(
  [
    {sid: 0,game: "1940",unit_name:"Infantry", title: "Supported by Artillery", info: "Attack at a 2 when paired with artillery on a one-to-one scale"},
    {sid: 0,game: "1940",unit_name:"Mechanized Infantry",title: "Supported by Artillery", info: "Attack at a 2 when paired with artillery on a one-to-one scale"},
    {sid: 1,game: "1940",unit_name:"Mechanized Infantry",title: "Blitz", info: "Can Blitz (see Tanks) through enemy territoyr when paried with a Tank"},
    {sid: 0,game: "1940",unit_name:"Artillery",title: "Supports (Mechanized) Infantry", info: "Increases attack of one (mechanized) infantry to 2 on a one-to-one scale"},
    {sid: 0,game: "1940",unit_name:"Tank",title: "Blitz", info: "Move through an unoccupied enemy territory then into a frienldy or hostile territory. Must occur during combat phase. Established control of first territory"},
    {sid: 1,game: "1940",unit_name:"Tank",title: "Combined Arms", info: "Can be combined with a tactical bomber or a mechanized infatnry \nTactical Bomber: Each tactical bomber paired with a tank has an increased attack from 3 to 4 \nMechanized Infantry:Each mecanized infantry paired with a tank to blitz"},
    {sid: 0,game: "1940",unit_name:"Antiaircraft Artillery",title: "Limited Move", info: "Can only move in non combat move unless loaded into a transport the previous turn"},
    {sid: 1,game: "1940",unit_name:"Antiaircraft Artillery",title: "No Combat Value", info: "Has a combat value of 0. Cannot fire on enemny units. Can be taken as a casuilty"},
    {sid: 2,game: "1940",unit_name:"Antiaircraft Artillery",title: "Air Defense", info: "Each AAA can fire at up to three incoming enenmy aircraft before the first round of combat. Roles of 1's are hits and casulties are removed instantly"},
    {sid: 0,game: "1940",unit_name:"Fighter",title: "Carrier Operations", info: "Fighters can take on and off from aircraft carriers"},
    {sid: 1,game: "1940",unit_name:"Fighter",title: "Figther Escort/Interceptor", info: "Can participate in tactcal and strategic bomobing runs as escorts/intercepors. Any or all defending fighters in the territory may participate. Attacking fighters can originate from anywhere"},
    {sid: 2,game: "1940",unit_name:"Fighter",title: "Air Superiority", info: "Can be paired with a tactcal bomber"},
    {sid: 0,game: "1940",unit_name:"Tactical Bomber",title: "Carrier Operations", info: "Tactical Bombers can take on and off from aircraft carriers"},
    {sid: 1,game: "1940",unit_name:"Tactical Bomber",title: "Air Supperiority", info: "Each tactical bomber paired with a fighter has an increased attack from 3 to 4"},
    {sid: 2,game: "1940",unit_name:"Tactical Bomber",title: "Combined Arms", info: "Each tactical bomber paried with a tank has an increased attack from 3 to 4"},
    {sid: 3,game: "1940",unit_name:"Tactical Bomber",title: "Tactical Bombing Raid", info: "Can participate in normal combat or make a direct attack against an enemy air or naval base"},
    {sid: 0,game: "1940",unit_name:"Strategic Bomber",title: "Strategic Bombing Raid", info: "Can participate in normal combat or make a direct attack against an enemy industrial complex, air base, or naval base"},
    {sid: 0,game: "1940",unit_name:"Submarine",title: "Suprise Strike", info: "Both attacking and defending submarines fire before any other units in the battle. Casulties are removd instantly"},
    {sid: 1,game: "1940",unit_name:"Submarine",title: "Submerisble", info: "Has the option to submerge before any round of combat and return to the game board"},
    {sid: 2,game: "1940",unit_name:"Submarine",title: "On Station", info: "Each Submarine rolls 2 dice when on an enemy convoy zone"},
    {sid: 3,game: "1940",unit_name:"Submarine",title: "Can't Hit or Be Hit By Air Units", info: "When attacking or defending, submarines cannot hit air units"},
    {sid: 0,game: "1940",unit_name:"Transport",title: "No Combat Value", info: "Has a combat value of 0, cannot fire in the attacking or defending units fire steps"},
    {sid: 1,game: "1940",unit_name:"Transport",title: "Doesn't Block Enemy Movement", info: "Any sea zones containing only transports does not stop enemny ships from passing through. Any air or naval units ending thier combat round in a sea zone with only enemy transports will destroy those transport"},
    {sid: 2,game: "1940",unit_name:"Transport",title: "Carry Land Units", info: "Transports can carry one infantry and one of any land unit"},
    {sid: 3,game: "1940",unit_name:"Transport",title: "Loading and Offloading", info: "Can load cargo in freindly sea zones, before, dunring, ad after moving. Loading onto and/or off a trnasport counts as a land unit's entire move"},
    {sid: 0,game: "1940",unit_name:"Destroyer",title: "Anit-Sub Vessel", info: "Cancells sumbarins suprise strike, submerisble, and can't be hit by enemy aircraft"},
    {sid: 0,game: "1940",unit_name:"Cruiser",title: "Offshore Bombardment", info: "Can conduct offshore bombardment during an amphibious assault"},
    {sid: 0,game: "1940",unit_name:"Aircaft Carrier",title: "Capital Ship", info: "Requires 2 hits to sink. Can be repairted at a friendly naval base"},
    {sid: 1,game: "1940",unit_name:"Aircaft Carrier",title: "Carry Aircraft", info: "Can carry up to 2 air units (fighters and tactcal bombers), including friendly powers."},
    {sid: 2,game: "1940",unit_name:"Aircaft Carrier",title: "Air Defense", info: "When an undamged carrier is attacked, its aircraft are considered defending"},
    {sid: 0,game: "1940",unit_name:"Battleship",title: "Capital Ship", info: "Requires 2 hits to sink. Can be repairted at a friendly naval base"},
    {sid: 1,game: "1940",unit_name:"Battleship",title: "Offshore Bombardment", info: "Can conduct offshore bombardment during an amphibious assault"},
    {sid: 0,game: "1940",unit_name:"Minor Factory",title: "Factory", info: "Each minor complex can build up to 3 units, can be upgraded for 20 IPCs"},
    {sid: 1,game: "1940",unit_name:"Minor Factory",title: "Subject to Damage", info: "For each damge marker the complex can mobalize one less unit. Maximum damgae of 6. Can not be upgraded if damaged"},
    {sid: 0,game: "1940",unit_name:"Major Factory",title: "Factory", info: "Each major complex can build up to 10 units"},
    {sid: 1,game: "1940",unit_name:"Minor Factory",title: "Subject to Damage", info: "For each damge marke, the complex can mobalize one less unit. Maximum of damage of 20"},
    {sid: 0,game: "1940",unit_name:"Air Base",title: "Air Unit Range", info: "Increases friendly air units movement by 1 if taking off from an operational air base"},
    {sid: 1,game: "1940",unit_name:"Air Base",title: "Scramble", info: "Up too 3 fighters/tactcal bombers can move to a sea zone to participate in the defense of the zone from an operational base"},
    {sid: 2,game: "1940",unit_name:"Air Base",title: "Subject to Damage", info: "Considered to be inoperative if it has 3 or more damage"},
    {sid: 0,game: "1940",unit_name:"Naval Base",title: "Services Sea Zones", info: "All sea zones that border a territory containing a naval base are considered to be in service by that base"},
    {sid: 1,game: "1940",unit_name:"Naval Base",title: "Sea Unit Range", info: "All naval units starting at an operational naval base have a increased movement range of 1"},
    {sid: 2,game: "1940",unit_name:"Naval Base",title: "Capital Ship Repairs", info: "Capital Ships can be repaired by moving into sea zone serviced by an operational naval base. Ships are repaired during the Purchase and Repair Units phase of owners turn"},
  ]
)
