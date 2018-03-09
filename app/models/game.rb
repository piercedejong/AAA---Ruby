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
    end
    # Change eco nation to the new nation
    eco_to_current
    reset_units
    self.update(bank: self.bank)
  end

  def buy_pacific
    self.update(current: self.current+1)
    self.eco_to_current
    self.reset_units
    self.update(bank: self.bank)
  end

  def change_eco
    self.update(eco: self.eco+1)
    if(self.eco>self.nations.last.nid)
      self.update(eco: 0)
    end
  end

  def change_bank(amount)
    self.update(bank: self.bank+amount)
    if(self.bank<0)
      self.update(bank: 0)
    end
  end

  def reset_units
    self.units.each {|u| u.update(count: 0)}
  end

  protected
    def eco_to_current
      self.update(eco: self.current)
    end

  private
    def create_uuid
      begin
        self.uuid = SecureRandom.uuid
      end while self.class.exists?(:uuid => uuid)
    end
end
