class Research < ApplicationRecord
  belongs_to :nation

  default_scope { order(created_at: :asc) }

  protected
    def self.create_1940_GrassHopper(game_uuid)
      researches = [
        {rid: 0, name: 'Heavy Artillery', text: 'All artillery now support up to 2 attacking infantry and/or mech infantry'},
        {rid: 1, name: 'Rockets', text: 'Each operational airbase may launch a rocket at an enemy facility up to 4 spaces away, roll 2 dice per rocket and apply the highest result for damage'},
        {rid: 2, name: 'Jet Fighters', text: 'All fighters now attack at 4 or less, and defend at 2 or less when escorting or intercepting'},
        {rid: 3, name: 'Long-Range Aircraft', text: 'Maximum movement range for all air units is now increased by 1'},
        {rid: 4, name: 'War Bonds', text: 'During the collect income phase, roll 2 dice and collect IPCs in the amount shown on the highest roll'},
        {rid: 5, name: 'Blitz Tactics', text: 'Mech infantry now attack at 2 or less if paired with a tank as well as artillery, they may blitz without tanks, and they may tow 1 artillery unit each during the non-combat movement phase'},
        {rid: 6, name: 'Super Submarine', text: 'All submarines now attack at 3 or less'},
        {rid: 7, name: 'Anti-Aircraft Radar', text: 'All ainti-aircraft fire from AA artillery, or AA guns built into facilities now defend at 2 or less'},
        {rid: 8, name: 'Improved Shipyards', text: 'Battleships, Aircraft Carriers, and Cruisers are now 3 IPCs cheaper, and Destroyers, Submarines, and transports are now 1 IPC cheaper'},
        {rid: 9, name: 'Mass Production', text: 'The mobilization capacity of all production facilities has been increased by 2. Also, you may remove 2 damage markers for the price of 1'},
        {rid: 10, name: 'Super Carrier Decks', text: 'All aircraft carriers may now carry up to 3 fighters and/or tactical bombers each'},
        {rid: 11, name: 'Heavy Bombers', text: 'When attacking during a battle or a SBR, roll 2 dice for each strategic bomber and select the best result'},
      ]
      Game.find_by(uuid: game_uuid).nations.each do |n|
        researches.each do |v|
          n.researches.create(v)
        end
      end
    end
end
