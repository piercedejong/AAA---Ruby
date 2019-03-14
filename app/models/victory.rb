class Victory < ApplicationRecord
  before_create :create_uuid
  belongs_to :game

  default_scope { order(created_at: :asc) }

  protected
    def self.create_1940_grasshopper(game)
      victories = [
        {vid: 0, axis: true, name: 'London',   text: 'The Axis control London', nation:"*The nation that takes control"},
        {vid: 1, axis: true, name: 'Moscow',   text: 'The Axis control Moscow', nation:"*The nation that takes control"},
        {vid: 2, axis: true, name: 'Sydney',   text: 'The Axis control Sydney', nation:"*The nation that takes control"},
        {vid: 3, axis: true, name: 'Asia',     text: 'The Axis control Shanghai, Honk Kong, Malaya, Calcutta', nation:"*Japan"},
        {vid: 4, axis: true, name: 'Africa',   text: 'The Axis control Morocco, Algeria, Tunisia, Libya, Tobruk, Alexandria, and Egypt', nation:"*The nation that controls the most"},
        {vid: 5, axis: true, name: 'Europe',   text: 'The Axis control 7 victory cities on the Europe map', nation:"*The nation that controls the most"},
        {vid: 6, axis: true, name: 'Pacific',  text: 'The Axis control 14 of the 16 Pacific Islands originally controlled by America and Japan', nation:"*Japan"},
        {vid: 7, axis: true, name: 'Supremacy',text: 'There are no American Capital ships on the board', nation:"*Japan"},
        {vid: 8, axis: true, name: 'Economy',  text: 'All 3 Axis powers have a total income of 142 IPCs (NO\'s not included)', nation:"*The nation with the highest income"},
        {vid: 9, axis: false,name: 'Berlin',   text: 'The Allies control Berlin', nation:"*The nation that takes control"},
        {vid: 10,axis: false,name: 'Tokyo',    text: 'The Allies control Tokyo', nation:"*The nation that takes control"},
        {vid: 11,axis: false,name: 'Rome',     text: 'The Allies control Rome', nation:"*The nation that takes control"},
        {vid: 12,axis: false,name: 'Asia',     text: 'The Allies control the Burma road, Honk Kong, and Shanghai', nation:"*The United Kingdom"},
        {vid: 13,axis: false,name: 'Africa',   text: 'The Allies control all non-neutral territories in Africa', nation:"*The nation that controls the most"},
        {vid: 14,axis: false,name: 'Communism',text: 'The Soviet Union controls 6 original Axis territories', nation:"*The Soviet Union"},
        {vid: 15,axis: false,name: 'Pacific',  text: 'The Allies control 14 of the 16 Pacific Islands originally controlled by America and Japan', nation:"*The United States"},
        {vid: 16,axis: false,name: 'Supremacy',text: 'There are no Japanese Capital ships on the board',nation:"*The United States"},
        {vid: 17,axis: false,name: 'Paris',    text: 'The Allies have liberated Paris', nation:"*The nation that liberates the city"},
      ]
      victories.each do |v|
        game.victories.create(v)
      end
    end


  private
    def create_uuid
      begin
        self.uuid = SecureRandom.uuid
      end while self.class.exists?(:uuid => uuid)
    end
end
