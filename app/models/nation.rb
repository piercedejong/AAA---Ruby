class Nation < ApplicationRecord
  before_create :create_uuid
  after_create :destroy_objectives
  belongs_to :game
  has_many :objectives
  has_many :researches
  default_scope { order(created_at: :asc) }

  def end_turn
    self.update(bank: self.bank + self.income + self.obj_income)
  end

  def buy_unit(unit)
    @cost = unit.cost
    self.researches.all.each do |r|
      if ["Mass Production", "Improved Shipyards"].include? r.name and r.enabled
        if ["Destroyer", "Transport", "Submarine"].include? unit.name
          @cost = @cost - 1
        elsif ["Aircraft Carrier", "Battleship", "Cruiser"].include? unit.name
          @cost = @cost - 3
        end
      end
    end

    if self.bank - @cost >=0
      unit.update(count: unit.count+1)
      self.update(bank: self.bank - @cost)
    end
  end

  def change_bank(amount)
    self.update(bank: self.bank+amount)
    if(self.bank<0)
      self.update(bank: 0)
    end
  end

  def change_income(amount)
    self.update(income: self.income+amount)
    if(self.income<0)
      self.update(income: 0)
    end
  end

  def obj_inc
    return self.name + " - " + self.obj_income.to_s
  end

  def total_income
    @total_income = self.income+self.obj_income
    return @total_income
  end

  protected
    @germany  = "#262626"
    @germanyL = '#8a8d8f'
    @ussr     = '#ad1f1f'
    @ussrL    = "#ed9292"
    @japan    = "#e67300"
    @japanL   = "#e5be9a"
    @usa      = "#669339"
    @usaL     = "#a6cd7e"
    @china    = "#cdc04c"
    @chinaL   = "#e3dc9c"
    @britain  = "#cb9b67"
    @britainL = "#e4cdb4"
    @italy    = "#995400"
    @italyL   = "#d79f5b"
    @anzac    = "#998780"
    @anzacL   = "#d2cac6"
    @france   = "#4d80b3"
    @franceL  = "#b8cfe0"
    def self.create_1940(game)
      nations = [
        # OLD COLOURS
        #{nid: 0,name: 'Germany',roundel: 'roundels/germany.png',color: '#282828',colorL: '#8a8d8f',bank: 30,income: 30},
        #nid: 1,name: 'USSR',   roundel: 'roundels/ussr.png',   color: '#872323',colorL: '#d55d5d',bank: 37,income: 37},
        #{nid: 2,name: 'Japan',  roundel: 'roundels/japan.png',  color: '#a2642a',colorL: '#e5be9a',bank: 26,income: 26},
        #{nid: 3,name: 'USA',    roundel: 'roundels/usa.png',    color: '#5a8232',colorL: '#a6cd7e',bank: 52,income: 52},
        #{nid: 4,name: 'China',  roundel: 'roundels/china.png',  color: '#bdb036',colorL: '#ddd588',bank: 12,income: 12},
        #{nid: 5,name: 'Britain',roundel: 'roundels/britain.png',color: '#d4ac80',colorL: '#e4ceb4',bank: 28,income: 28},
        #{nid: 6,name: 'Pacific',roundel: 'roundels/pacific.png',color: '#d4ac80',colorL: '#e4ceb4',bank: 17,income: 17},
        #{nid: 7,name: 'Italy',  roundel: 'roundels/italy.png',  color: '#754100',colorL: '#995f16',bank: 10,income: 10},
        #{nid: 8,name: 'ANZAC',  roundel: 'roundels/anzac.png',  color: '#87746d',colorL: '#c6bcb8',bank: 10,income: 10},
        #{nid: 9,name: 'France', roundel: 'roundels/france.png', color: '#3e6d91',colorL: '#a6c3d9',bank: 19,income: 19},

        {nid: 0,name: 'Germany',roundel: 'roundels/germany.png',color: @germany,colorL: @germanyL,bank: 30,income: 30},
        {nid: 1,name: 'USSR',   roundel: 'roundels/ussr.png',   color: @ussr,   colorL: @ussrL,   bank: 37,income: 37},
        {nid: 2,name: 'Japan',  roundel: 'roundels/japan.png',  color: @japan,  colorL: @japanL,  bank: 26,income: 26},
        {nid: 3,name: 'USA',    roundel: 'roundels/usa.png',    color: @usa,    colorL: @usaL,    bank: 52,income: 52},
        {nid: 4,name: 'China',  roundel: 'roundels/china.png',  color: @china,  colorL: @chinaL,  bank: 12,income: 12},
        {nid: 5,name: 'Britain',roundel: 'roundels/britain.png',color: @britain,colorL: @britainL,bank: 28,income: 28},
        {nid: 6,name: 'Pacific',roundel: 'roundels/pacific.png',color: @britain,colorL: @britainL,bank: 17,income: 17},
        {nid: 7,name: 'Italy',  roundel: 'roundels/italy.png',  color: @italy,  colorL: @italyL,  bank: 10,income: 10},
        {nid: 8,name: 'ANZAC',  roundel: 'roundels/anzac.png',  color: @anzac,  colorL: @anzacL,  bank: 10,income: 10},
        {nid: 9,name: 'France', roundel: 'roundels/france.png', color: @france, colorL: @franceL, bank: 19,income: 19},
      ]
      nations.each do |n|
        game.nations.create(n)
      end
    end

    def self.create_1940_house(game)
      nations = [
        {nid: 0,name: 'Germany',roundel: 'roundels/germany.png',color: @germany,colorL: @germanyL,bank: 30,income: 30},
        {nid: 1,name: 'USSR',   roundel: 'roundels/ussr.png',   color: @ussr,   colorL: @ussrL,   bank: 37,income: 37},
        {nid: 2,name: 'Japan',  roundel: 'roundels/japan.png',  color: @japan,  colorL: @japanL,  bank: 26,income: 26},
        {nid: 3,name: 'USA',    roundel: 'roundels/usa.png',    color: @usa,    colorL: @usaL,    bank: 52,income: 52},
        {nid: 4,name: 'China',  roundel: 'roundels/china.png',  color: @china,  colorL: @chinaL,  bank: 12,income: 12},
        {nid: 5,name: 'Britain',roundel: 'roundels/britain.png',color: @britain,colorL: @britainL,bank: 45,income: 45},
        {nid: 6,name: 'Italy',  roundel: 'roundels/italy.png',  color: @italy,  colorL: @italyL,  bank: 10,income: 10},
        {nid: 7,name: 'ANZAC',  roundel: 'roundels/anzac.png',  color: @anzac,  colorL: @anzacL,  bank: 10,income: 10},
        {nid: 8,name: 'France', roundel: 'roundels/france.png', color: @france, colorL: @franceL, bank: 19,income: 19},
      ]
      nations.each do |n|
        game.nations.create(n)
      end
    end

    def self.create_1940_one_eco(game)
      nations = [
        {nid: 0,name: 'Germany',roundel: 'roundels/germany.png',color: @germany,colorL: @germanyL,bank: 30,income: 30},
        {nid: 1,name: 'USSR',   roundel: 'roundels/ussr.png',   color: @ussr,   colorL: @ussrL,   bank: 37,income: 37},
        {nid: 2,name: 'Japan',  roundel: 'roundels/japan.png',  color: @japan,  colorL: @japanL,  bank: 26,income: 26},
        {nid: 3,name: 'USA',    roundel: 'roundels/usa.png',    color: @usa,    colorL: @usaL,    bank: 52,income: 52},
        {nid: 4,name: 'China',  roundel: 'roundels/china.png',  color: @china,  colorL: @chinaL,  bank: 12,income: 12},
        {nid: 5,name: 'Britain',roundel: 'roundels/britain.png',color: @britain,colorL: @britainL,bank: 45,income: 45},
        {nid: 6,name: 'Italy',  roundel: 'roundels/italy.png',  color: @italy,  colorL: @italyL,  bank: 10,income: 10},
        {nid: 7,name: 'ANZAC',  roundel: 'roundels/anzac.png',  color: @anzac,  colorL: @anzacL,  bank: 10,income: 10},
        {nid: 8,name: 'France', roundel: 'roundels/france.png', color: @france, colorL: @franceL, bank: 19,income: 19},
      ]
      nations.each do |n|
        game.nations.create(n)
      end
    end

    def self.create_1940_europe(game)
      nations = [
        {nid: 0,name: 'Germany',roundel: 'roundels/germany.png',color: @germany,colorL: @germanyL,bank: 30,income: 30},
        {nid: 1,name: 'USSR',   roundel: 'roundels/ussr.png',   color: @ussr,   colorL: @ussrL,   bank: 37,income: 37},
        {nid: 2,name: 'USA',    roundel: 'roundels/usa.png',    color: @usa,    colorL: @usaL,    bank: 52,income: 52},
        {nid: 3,name: 'Britain',roundel: 'roundels/britain.png',color: @britain,colorL: @britainL,bank: 28,income: 28},
        {nid: 4,name: 'Italy',  roundel: 'roundels/italy.png',  color: @italy,  colorL: @italyL,  bank: 10,income: 10},
        {nid: 5,name: 'France', roundel: 'roundels/france.png', color: @france, colorL: @franceL, bank: 19,income: 19},
      ]
      nations.each do |n|
        game.nations.create(n)
      end
    end

    def self.create_1940_pacific(game)
      nations = [
        {nid: 0,name: 'Japan',  roundel: 'roundels/japan.png',  color: @japan,  colorL: @japanL,  bank: 26,income: 26},
        {nid: 1,name: 'USA',    roundel: 'roundels/usa.png',    color: @usa,    colorL: @usaL,    bank: 52,income: 52},
        {nid: 2,name: 'China',  roundel: 'roundels/china.png',  color: @china,  colorL: @chinaL,  bank: 12,income: 12},
        {nid: 3,name: 'Britain',roundel: 'roundels/britain.png',color: @britain,colorL: @britainL,bank: 28,income: 28},
        {nid: 4,name: 'ANZAC',  roundel: 'roundels/anzac.png',  color: @anzac,  colorL: @anzacL,  bank: 10,income: 10},
      ]
      nations.each do |n|
        game.nations.create(n)
      end
    end

    def self.create_1940_grasshopper(game)
      nations = [
        {nid: 0,name: 'Germany',roundel: 'roundels/germany.png',color: @germany,colorL: @germanyL,bank: 30,income: 30},
        {nid: 1,name: 'USSR',   roundel: 'roundels/ussr.png',   color: @ussr,   colorL: @ussrL,   bank: 37,income: 37},
        {nid: 2,name: 'Japan',  roundel: 'roundels/japan.png',  color: @japan,  colorL: @japanL,  bank: 26,income: 26},
        {nid: 3,name: 'USA',    roundel: 'roundels/usa.png',    color: @usa,    colorL: @usaL,    bank: 52,income: 52},
        {nid: 4,name: 'China',  roundel: 'roundels/china.png',  color: @china,  colorL: @chinaL,  bank: 12,income: 12},
        {nid: 5,name: 'Britain',roundel: 'roundels/britain.png',color: @britain,colorL: @britainL,bank: 28,income: 28},
        {nid: 6,name: 'Pacific',roundel: 'roundels/pacific.png',color: @britain,colorL: @britainL,bank: 17,income: 17},
        {nid: 7,name: 'Italy',  roundel: 'roundels/italy.png',  color: @italy,  colorL: @italyL,  bank: 10,income: 10},
        {nid: 8,name: 'ANZAC',  roundel: 'roundels/anzac.png',  color: @anzac,  colorL: @anzacL,  bank: 10,income: 10},
        {nid: 9,name: 'France', roundel: 'roundels/france.png', color: @france, colorL: @franceL, bank: 19,income: 19},
      ]
      nations.each do |n|
        game.nations.create(n)
      end
    end

    def self.create_1942(game)
      nations = [
        {nid: 0,name: 'USSR',   roundel: 'roundels/ussr.png',   color: @ussr,   colorL: @ussrL,   bank: 24,income: 24},
        {nid: 1,name: 'Germany',roundel: 'roundels/germany.png',color: @germany,colorL: @germanyL,bank: 41,income: 41},
        {nid: 2,name: 'Britain',roundel: 'roundels/britain.png',color: @britain,colorL: @britainL,bank: 31,income: 31},
        {nid: 3,name: 'Japan',  roundel: 'roundels/japan.png',  color: @japan,  colorL: @japanL,  bank: 30,income: 30},
        {nid: 4,name: 'USA',    roundel: 'roundels/usa.png',    color: @usa,    colorL: @usaL,    bank: 42,income: 42},
      ]
      nations.each do |n|
        game.nations.create(n)
      end
    end

    def self.create_1914(game)
      nations = [
        {nid: 0,name: 'Austria',       roundel: 'roundels/ussr.png',   color: '#40bf40',colorL: '#8cd98c',bank: 24,income: 24},
        {nid: 1,name: 'Russia',        roundel: 'roundels/germany.png',color: '#872323',colorL: '#d55d5d',bank: 41,income: 41},
        {nid: 2,name: 'Germany',       roundel: 'roundels/britain.png',color: '#282828',colorL: '#8a8d8f',bank: 31,income: 31},
        {nid: 3,name: 'France',        roundel: 'roundels/japan.png',  color: '#3e6d91',colorL: '#a6c3d9',bank: 30,income: 30},
        {nid: 4,name: 'Britain',       roundel: 'roundels/usa.png',    color: '#d4ac80',colorL: '#e4ceb4',bank: 42,income: 42},
        {nid: 5,name: 'Ottoman Empire',roundel: 'roundels/usa.png',    color: '#248f8f',colorL: '#80ffff',bank: 42,income: 42},
        {nid: 6,name: 'Italy',         roundel: 'roundels/usa.png',    color: '#754100',colorL: '#995f16',bank: 42,income: 42},
        {nid: 7,name: 'USA',         roundel: 'roundels/usa.png',    color: '#5a8232',colorL: '#a6cd7e',bank: 42,income: 42},
      ]
      nations.each do |n|
        game.nations.create(n)
      end
    end

  private
    def create_uuid
      begin
        self.uuid = SecureRandom.uuid
      end while self.class.exists?(:uuid => uuid)
    end

    def destroy_objectives
      self.objectives.all.each {|o| o.destroy}
    end
end
