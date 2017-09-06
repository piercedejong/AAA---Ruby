class Objective < ApplicationRecord
  belongs_to :nation

  default_scope { order(created_at: :asc) }

  protected
    def self.create_1940(game_uuid)
      germany=[
        {oid: 0, name: 'Peace with USSR', value: 5, enabled: false},
        {oid: 1, name: 'Axis control of Caucasus', value: 5, enabled: false},
        {oid: 2, name: 'At least 1 German unit in Axis-controlled Egypt', value: 5, enabled: false},
        {oid: 3, name: 'Germany controls Novgorod (Leningrad)', value: 5, enabled: false},
        {oid: 4, name: 'Germany controls Volograd (Stalingrad)', value: 5, enabled: false},
        {oid: 5, name: 'Germany controls Russia (Moscow)', value: 5, enabled: false},
        {oid: 6, name: 'Germany controls United Kingdom (London)', value: 5, enabled: false},
        {oid: 7, name: 'Germany controls: Denmark and Norway. Sweden is not pro-allied or allied controlled', value: 5, enabled: false},
        {oid: 8, name: 'Germany controls Iraq', value: 2, enabled: false},
        {oid: 9, name: 'Germany controls Persia', value:2, enabled: false},
        {oid: 10, name: 'Germany controls Northwest Persia', value: 2, enabled: false},
      ]
      ussr=[
        {oid: 0, name: 'No Axis warships in sea zone 25 and USSR controls Archangel', value: 5, enabled: false},
        {oid: 1, name: 'No Allied units on any original Russian territories', value: 5, enabled: false},
        {oid: 2, name: 'First time capturing Germany (Berlin)', value: 10, enabled: false},
      ]
      japan=[
        {oid: 0, name: 'Peace with the U.S.A. and no unprovoked attacks on Britain, ANZAC or French Indo-China', value: 10, enabled: false},
        {oid: 1, name: 'Axis control: Guam, Midway, Wake Island, Gilbert Islands, and Solomon Islands', value: 5, enabled: false},
        {oid: 2, name: 'Axis control: Sumatra, Java, Borneo, and Celebs', value: 5, enabled: false},
        {oid: 3, name: 'Axis control India (Calcutta)', value: 5, enabled: false},
        {oid: 4, name: 'Axis control New South Wales (Sydney)', value: 5, enabled: false},
        {oid: 5, name: 'Axis control Hawaiian Islands (Honolulu)', value: 5, enabled: false},
        {oid: 6, name: 'Axis contorl Western United States (San Francisco)', value: 5, enabled: false},
        {oid: 7, name: 'Japan controls all original Chinese territories', value: 5, enabled: false},
      ]
      usa=[
        {oid: 0, name: 'USA controls: Eastern United States, Central United States, Western United States', value: 10, enabled: false},
        {oid: 1, name: 'USA controls: Alaska, Aleutian Islands, Hawaiian Islands, Johnston Island, and Line Islands', value: 5, enabled: false},
        {oid: 2, name: 'USA controls: Mexicom South Eastern Mexico, Central America, and West Indies', value: 5, enabled: false},
        {oid: 3, name: 'USA controls the Philippines', value: 5, enabled: false},
        {oid: 4, name: 'USA is at war with all Axis powers', value: 5, enabled: false},
        {oid: 5, name: 'There is at least one U.S.A. land unit in France (Paris)', value: 5, enabled: false},
      ]
      china=[
        {oid: 0, name: 'Burma Road is open, Allies control: India, Burma, Yunnan and Szechwan', value: 6, enabled: false},
      ]
      britain=[
        {oid: 0, name: 'Britain controls all of its original territories (Must be at war in Europe)', value: 5, enabled: false},
        {oid: 1, name: 'No German submarines anywhere on the board other than sea zones 100,113,114,115', value: 5, enabled: false},
      ]
      pacific=[
        {oid: 0, name: 'Britain Pacific control both Kwangtung and Malaya', value: 5, enabled: false},
      ]
      italy=[
        {oid: 0, name: 'No Allied surface warships in the Mediterranean sea', value: 5, enabled: false},
        {oid: 1, name: 'Axis control 3 of the following: Gibraltar, Southern France, Greeece, Egypt', value: 5, enabled: false},
        {oid: 2, name: 'Axis contorls Morocco, Algeria, Tunisia, Libya, Tobruk, and Alexandria', value: 5, enabled: false},
        {oid: 3, name: 'Italy controls Iraq', value: 5, enabled: false},
        {oid: 4, name: 'Italy controls Perisa', value: 5, enabled: false},
        {oid: 5, name: 'Italy control Northwest Persia ', value: 5, enabled: false},
      ]
      anzac=[
        {oid: 0, name: 'ANZAC controls all original territories, Allies control Malaya', value: 5, enabled: false},
        {oid: 1, name: 'Allies (not Dutch) control Dutch New Guinea, New Guinea, New Britain, and the Solomon Isalnds', value: 5, enabled: false},
        {oid: 2, name: 'Allies control Egypt (Cairo) (when at war with Germany/Italy)', value: 5, enabled: false},
      ]
      france=[
        {oid: 0, name: 'First time Paris is liberated place up to 12IPC worth of units', value: 0, enabled: false},
      ]
      Game.find_by(uuid: game_uuid).nations.each do |n|
        @obj = []
        puts case n.name
          when "Germany"
            @obj=germany
          when "USSR"
            @obj=ussr
          when "Japan"
            @obj=japan
          when "USA"
            @obj=usa
          when "China"
            @obj=china
          when "Britain"
            @obj=britain
          when "Pacific"
            @obj=pacific
          when "Italy"
            @obj=italy
          when "ANZAC"
            @obj=anzac
          when "France"
            @obj=france
          end
        @obj.each do |o|
          n.objectives.create(o)
        end
      end
    end

    def create_1942_objectives()
    end
end
