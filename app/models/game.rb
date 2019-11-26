class Game < ApplicationRecord
  before_create :create_uuid
  belongs_to :user
  has_many :nations
  has_many :units
  has_many :victories
  validates :name, presence: true, length: {minimum: 3}
  validates :game_name, presence: true, length: {minimum: 1}


  def end_turn
    self.update(current: self.current+1)
    if(self.current>self.nations.last.nid)
      self.update(current: 0)
      self.update(round: self.round+1)
    end
    # Change eco nation to the new nation
    self.eco_to_current
    self.reset_units
    self.update(bank: self.nations.find_by(nid: self.current).bank)
  end

  def buy_pacific
    self.update(current: self.current+1)
    self.eco_to_current
    self.reset_units
    self.update(bank: self.nations.find_by(nid: self.current).bank)
  end

  def change_eco_forward
    self.update(eco: self.eco+1)
    if(self.eco>self.nations.last.nid)
      self.update(eco: 0)
    end
  end

  def change_eco_backward
    self.update(eco: self.eco-1)
    if(self.eco<0)
      self.update(eco: self.nations.last.nid)
    end
  end

  def reset_units
    bank = 0
    self.units.each { |u|
      bank += u.count*u.cost
      u.update(count: 0)
    }
    return bank
  end

  def eco_to_current
    self.update(eco: self.current)
  end

  def research_nations
    self.nations.where("name != ?", 'France').where("name != ?", 'China').where("name != ?", 'Pacific')
  end

  private
    def create_uuid
      begin
        self.uuid = SecureRandom.uuid
      end while self.class.exists?(:uuid => uuid)
    end
end
