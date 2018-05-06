class Special < ApplicationRecord
  belongs_to :unit


  protected
  def self.create_1940(game)
    unit = [
      inf = [
        {sid: 0,title: "Supported by Artillery", info: "Attack at a 2 when paired with artillery on a one-to-one scale"},
      ],
      mec = [
        {sid: 0,title: "Supported by Artillery", info: "Attack at a 2 when paired with artillery on a one-to-one scale"},
        {sid: 1,title: "Blitz", info: "Can Blitz (see Tanks) through enemy territoyr when paried with a Tank"},
      ],
      art = [
        {sid: 0,title: "Supports (Mechanized) Infantry", info: "Increases attack of one (mechanized) infantry to 2 on a one-to-one scale"},
      ],
      tnk = [
        {sid: 0,title: "Blitz", info: "Move through an unoccupied enemy territory then into a frienldy or hostile territory. Must occur during combat phase. Established control of first territory"},
        {sid: 1,title: "Combined Arms", info: "Can be combined with a tactical bomber or a mechanized infatnry \nTactical Bomber: Each tactical bomber paired with a tank has an increased attack from 3 to 4 \nMechanized Infantry:Each mecanized infantry paired with a tank to blitz"},
      ],
      aaa = [
        {sid: 0,title: "Limited Move", info: "Can only move in non combat move unless loaded into a transport the previous turn"},
        {sid: 1,title: "No Combat Value", info: "Has a combat value of 0. Cannot fire on enemny units. Can be taken as a casuilty"},
        {sid: 2,title: "Air Defense", info: "Each AAA can fire at up to three incoming enenmy aircraft before the first round of combat. Roles of 1's are hits and casulties are removed instantly"},
      ],
      fgh = [
        {sid: 0,title: "Carrier Operations", info: "Fighters can take on and off from aircraft carriers"},
        {sid: 1,title: "Figther Escort/Interceptor", info: "Can participate in tactcal and strategic bomobing runs as escorts/intercepors. Any or all defending fighters in the territory may participate. Attacking fighters can originate from anywhere"},
        {sid: 0,title: "Air Superiority", info: "Can be paired with a tactcal bomber"},
      ],
      tac = [
        {sid: 0,title: "Carrier Operations", info: "Fighters can take on and off from aircraft carriers"},
        {sid: 1,title: "Air Supperiority", info: "Each tactical bomber paired with a fighter has an increased attack from 3 to 4"},
        {sid: 2,title: "Combined Arms", info: "Each tactical bomber paried with a tank has an increased attack from 3 to 4"},
        {sid: 3,title: "Tactical Bombing Raid", info: "Can participate in normal combat or make a direct attack against an enemy air or naval base"},
      ],
      str = [
        {sid: 0,title: "Strategic Bombing Raid", info: "Can participate in normal combat or make a direct attack against an enemy industrial complex, air base, or naval base"},
      ],
      sub = [
        {sid: 0,title: "Suprise Strike", info: "Both attacking and defending submarines fire before any other units in the battle. Casulties are removd instantly"},
        {sid: 1,title: "Submerisble", info: "Has the option to submerge before any round of combat and return to the game board"},
        {sid: 2,title: "On Station", info: "Each Submarine rolls 2 dice when on an enemy convoy zone"},
        {sid: 3,title: "Can't Hit or Be Hit By Air Units", info: "When attacking or defending, submarines cannot hit air units"},

      ],
      tnt = [
        {sid: 0,title: "No Combat Value", info: "Has a combat value of 0, cannot fire in the attacking or defending units fire steps"},
        {sid: 1,title: "Doesn't Block Enemy Movement", info: "Any sea zones containing only transports does not stop enemny ships from passing through. Any air or naval units ending thier combat round in a sea zone with only enemy transports will destroy those transport"},
        {sid: 2,title: "Carry Land Units", info: "Transports can carry one infantry and one of any land unit"},
        {sid: 3,title: "Loading and Offloading", info: "Can load cargo in freindly sea zones, before, dunring, ad after moving. Loading onto and/or off a trnasport counts as a land unit's entire move"},
      ],
      dst = [
        {sid: 0,title: "Anit-Sub Vessel", info: "Cancells sumbarins suprise strike, submerisble, and can't be hit by enemy aircraft"},
      ],
      crs = [
        {sid: 0,title: "Offshore Bombardment", info: "Can conduct offshore bombardment during an amphibious assault"},
      ],
      car = [
        {sid: 0,title: "Capital Ship", info: "Requires 2 hits to sink. Can be repairted at a friendly naval base"},
        {sid: 1,title: "Carry Aircraft", info: "Can carry up to 2 air units (fighters and tactcal bombers), including friendly powers."},
        {sid: 2,title: "Air Defense", info: "When an undamged carrier is attacks, its aircraft are considered defending "},
      ],
      btl = [
        {sid: 0,title: "Capital Ship", info: "Requires 2 hits to sink. Can be repairted at a friendly naval base"},
        {sid: 1,title: "Offshore Bombardment", info: "Can conduct offshore bombardment during an amphibious assault"},
      ],
      min = [
        {sid: 0,title: "Factory", info: "Each minor complex can build up to 3 units, can be upgraded for 20 IPCs"},
        {sid: 1,title: "Subject to Damage", info: "For each damge marker the complex can mobalize one less unit. Maximum damgae of 6. Can not be upgraded if damaged"},
      ],
      maj = [
        {sid: 0,title: "Factory", info: "Each major complex can build up to 10 units"},
        {sid: 1,title: "Subject to Damage", info: "For each damge marke, the complex can mobalize one less unit. Maximum of damage of 20"},
      ],
      air = [
        {sid: 0,title: "Air Unit Range", info: "Increases friendly air units movement by 1 if taking off from an operational air base"},
        {sid: 1,title: "Scramble", info: "Up too 3 fighters/tactcal bombers can move to a sea zone to participate in the defense of the zone from an operational base"},
        {sid: 2,title: "Subject to Damage", info: "Considered to be inoperative if it has 3 or more damage"},
      ],
      nvl = [
        {sid: 0,title: "Services Sea Zones", info: "All sea zones that border a territory containing a naval base are considered to be in service by that base"},
        {sid: 1,title: "Sea Unit Range", info: "All naval units starting at an operational naval base have a increased movement range of 1"},
        {sid: 2,title: "Subject to Damage", info: "Considered to be inoperative if it has 3 or more damage"},
        {sid: 3,title: "Capital Ship Repairs", info: "Capital Ships can be repaired by moving into sea zone serviced by an operational naval base. Ships are repaired during the Purchase and Repair Units phase of owners turn"},
      ],
    ]
    game.units.all.each do |u|
      unit[u.uid].each do |x|
        u.specials.create(x)
      end
    end
  end

  def self.create_1940_house(game)
    unit = [
      inf = [
        {sid: 0,title: "Supported by Artillery", info: "Attack at a 2 when paired with artillery on a one-to-one scale"},
      ],
      mec = [
        {sid: 0,title: "Supported by Artillery", info: "Attack at a 2 when paired with artillery on a one-to-one scale"},
        {sid: 1,title: "Blitz", info: "Can Blitz (see Tanks) through enemy territoyr when paried with a Tank"},
      ],
      art = [
        {sid: 0,title: "Supports (Mechanized) Infantry", info: "Increases attack of one (mechanized) infantry to 2 on a one-to-one scale"},
      ],
      tnk = [
        {sid: 0,title: "Blitz", info: "Move through an unoccupied enemy territory then into a frienldy or hostile territory. Must occur during combat phase. Established control of first territory"},
        {sid: 1,title: "Combined Arms", info: "Can be combined with a tactical bomber or a mechanized infatnry \nTactical Bomber: Each tactical bomber paired with a tank has an increased attack from 3 to 4 \nMechanized Infantry:Each mecanized infantry paired with a tank to blitz"},
      ],
      aaa = [
        {sid: 0,title: "Limited Move", info: "Can only move in non combat move unless loaded into a transport the previous turn"},
        {sid: 1,title: "No Combat Value", info: "Has a combat value of 0. Cannot fire on enemny units. Can be taken as a casuilty"},
        {sid: 2,title: "Air Defense", info: "Each AAA can fire at up to three incoming enenmy aircraft before the first round of combat. Roles of 1's are hits and casulties are removed instantly"},
      ],
      fgh = [
        {sid: 0,title: "Carrier Operations", info: "Fighters can take on and off from aircraft carriers"},
        {sid: 1,title: "Figther Escort/Interceptor", info: "Can participate in tactcal and strategic bomobing runs as escorts/intercepors. Any or all defending fighters in the territory may participate. Attacking fighters can originate from anywhere"},
        {sid: 0,title: "Air Superiority", info: "Can be paired with a tactcal bomber"},
      ],
      tac = [
        {sid: 0,title: "Carrier Operations", info: "Fighters can take on and off from aircraft carriers"},
        {sid: 1,title: "Air Supperiority", info: "Each tactical bomber paired with a fighter has an increased attack from 3 to 4"},
        {sid: 2,title: "Combined Arms", info: "Each tactical bomber paried with a tank has an increased attack from 3 to 4"},
        {sid: 3,title: "Tactical Bombing Raid", info: "Can participate in normal combat or make a direct attack against an enemy air or naval base"},
      ],
      str = [
        {sid: 0,title: "Strategic Bombing Raid", info: "Can participate in normal combat or make a direct attack against an enemy industrial complex, air base, or naval base"},
      ],
      sub = [
        {sid: 0,title: "Suprise Strike", info: "Both attacking and defending submarines fire before any other units in the battle. Casulties are removd instantly"},
        {sid: 1,title: "Submerisble", info: "Has the option to submerge before any round of combat and return to the game board"},
        {sid: 2,title: "On Station", info: "Each Submarine rolls 2 dice when on an enemy convoy zone"},
        {sid: 3,title: "Can't Hit or Be Hit By Air Units", info: "When attacking or defending, submarines cannot hit air units"},

      ],
      tnt = [
        {sid: 0,title: "No Combat Value", info: "Has a combat value of 0, cannot fire in the attacking or defending units fire steps"},
        {sid: 1,title: "Doesn't Block Enemy Movement", info: "Any sea zones containing only transports does not stop enemny ships from passing through. Any air or naval units ending thier combat round in a sea zone with only enemy transports will destroy those transport"},
        {sid: 2,title: "Carry Land Units", info: "Transports can carry one infantry and one of any land unit"},
        {sid: 3,title: "Loading and Offloading", info: "Can load cargo in freindly sea zones, before, dunring, ad after moving. Loading onto and/or off a trnasport counts as a land unit's entire move"},
      ],
      dst = [
        {sid: 0,title: "Anit-Sub Vessel", info: "Cancells sumbarins suprise strike, submerisble, and can't be hit by enemy aircraft"},
      ],
      crs = [
        {sid: 0,title: "Offshore Bombardment", info: "Can conduct offshore bombardment during an amphibious assault"},
      ],
      car = [
        {sid: 0,title: "Capital Ship", info: "Requires 2 hits to sink. Can be repairted at a friendly naval base"},
        {sid: 1,title: "Carry Aircraft", info: "Can carry up to 2 air units (fighters and tactcal bombers), including friendly powers."},
        {sid: 2,title: "Air Defense", info: "When an undamged carrier is attacks, its aircraft are considered defending "},
      ],
      btl = [
        {sid: 0,title: "Capital Ship", info: "Requires 2 hits to sink. Can be repairted at a friendly naval base"},
        {sid: 1,title: "Offshore Bombardment", info: "Can conduct offshore bombardment during an amphibious assault"},
      ],
      min = [
        {sid: 0,title: "Factory", info: "Each minor complex can build up to 3 units, can be upgraded for 20 IPCs"},
        {sid: 1,title: "Subject to Damage", info: "For each damge marker the complex can mobalize one less unit. Maximum damgae of 6. Can not be upgraded if damaged"},
      ],
      maj = [
        {sid: 0,title: "Factory", info: "Each major complex can build up to 10 units"},
        {sid: 1,title: "Subject to Damage", info: "For each damge marke, the complex can mobalize one less unit. Maximum of damage of 20"},
      ],
      air = [
        {sid: 0,title: "Air Unit Range", info: "Increases friendly air units movement by 1 if taking off from an operational air base"},
        {sid: 1,title: "Scramble", info: "Up too 3 fighters/tactcal bombers can move to a sea zone to participate in the defense of the zone from an operational base"},
        {sid: 2,title: "Subject to Damage", info: "Considered to be inoperative if it has 3 or more damage"},
      ],
      nvl = [
        {sid: 0,title: "Services Sea Zones", info: "All sea zones that border a territory containing a naval base are considered to be in service by that base"},
        {sid: 1,title: "Sea Unit Range", info: "All naval units starting at an operational naval base have a increased movement range of 1"},
        {sid: 2,title: "Subject to Damage", info: "Considered to be inoperative if it has 3 or more damage"},
        {sid: 3,title: "Capital Ship Repairs", info: "Capital Ships can be repaired by moving into sea zone serviced by an operational naval base. Ships are repaired during the Purchase and Repair Units phase of owners turn"},
      ],
    ]
    game.units.all.each do |u|
      unit[u.uid].each do |x|
        u.specials.create(x)
      end
    end
  end
end
