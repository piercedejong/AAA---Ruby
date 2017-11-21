class Nation < ApplicationRecord
  before_create :create_uuid
  belongs_to :game
  has_many :objectives
  has_many :researches
  default_scope { order(created_at: :asc) }

  def end_turn
    self.update(bank: self.bank+self.income+self.obj_income)
  end

  def buy_unit(unit)
    if self.bank - unit.cost >=0
      unit.update(count: unit.count+1)
      self.update(bank: self.bank - unit.cost)
    end
  end

  def total_income
    @total_income = self.income+self.obj_income
    return @total_income
  end

  protected
    @germany  = "#0d0d0d"
    @germanyL = '#8a8d8f'
    @ussr     = '#8f1919'
    @ussrL    = "#ed9292"
    @japan    = "#a2642a"
    @japanL   = "#e5be9a"
    @usa      = "#4d6e2b"
    @usaL     = "#a6cd7e"
    @china    = "#b3a632"
    @chinaL   = "#ddd588"
    @britain  = "#cb9b67"
    @britainL = "#e4cdb4"
    @italy    = "#754100"
    @italyL   = "#d79f5b"
    @anzac    = "#7f6d66"
    @anzacL   = "#d2cac6"
    @france   = "#365e7d"
    @franceL  = "#b8cfe0"
    def self.create_1940(game_uuid)
      nations = [
        # OLD COLOURS
        #{nid: 0,name: 'Germany',roundel: 'germany.png',color: '#282828',colorL: '#8a8d8f',bank: 30,income: 30},
        #nid: 1,name: 'USSR',   roundel: 'ussr.png',   color: '#872323',colorL: '#d55d5d',bank: 37,income: 37},
        #{nid: 2,name: 'Japan',  roundel: 'japan.png',  color: '#a2642a',colorL: '#e5be9a',bank: 26,income: 26},
        #{nid: 3,name: 'USA',    roundel: 'usa.png',    color: '#5a8232',colorL: '#a6cd7e',bank: 52,income: 52},
        #{nid: 4,name: 'China',  roundel: 'china.png',  color: '#bdb036',colorL: '#ddd588',bank: 12,income: 12},
        #{nid: 5,name: 'Britain',roundel: 'britain.png',color: '#d4ac80',colorL: '#e4ceb4',bank: 28,income: 28},
        #{nid: 6,name: 'Pacific',roundel: 'pacific.png',color: '#d4ac80',colorL: '#e4ceb4',bank: 17,income: 17},
        #{nid: 7,name: 'Italy',  roundel: 'italy.png',  color: '#754100',colorL: '#995f16',bank: 10,income: 10},
        #{nid: 8,name: 'ANZAC',  roundel: 'anzac.png',  color: '#87746d',colorL: '#c6bcb8',bank: 10,income: 10},
        #{nid: 9,name: 'France', roundel: 'france.png', color: '#3e6d91',colorL: '#a6c3d9',bank: 19,income: 19},

        {nid: 0,name: 'Germany',roundel: 'germany.png',color: @germany,colorL: @germanyL,bank: 30,income: 30},
        {nid: 1,name: 'USSR',   roundel: 'ussr.png',   color: @ussr,   colorL: @ussrL,   bank: 37,income: 37},
        {nid: 2,name: 'Japan',  roundel: 'japan.png',  color: @japan,  colorL: @japanL,  bank: 26,income: 26},
        {nid: 3,name: 'USA',    roundel: 'usa.png',    color: @usa,    colorL: @usaL,    bank: 52,income: 52},
        {nid: 4,name: 'China',  roundel: 'china.png',  color: @china,  colorL: @chinaL,  bank: 12,income: 12},
        {nid: 5,name: 'Britain',roundel: 'britain.png',color: @britain,colorL: @britainL,bank: 28,income: 28},
        {nid: 6,name: 'Pacific',roundel: 'pacific.png',color: @britain,colorL: @britainL,bank: 17,income: 17},
        {nid: 7,name: 'Italy',  roundel: 'italy.png',  color: @italy,  colorL: @italyL,  bank: 10,income: 10},
        {nid: 8,name: 'ANZAC',  roundel: 'anzac.png',  color: @anzac,  colorL: @anzacL,  bank: 10,income: 10},
        {nid: 9,name: 'France', roundel: 'france.png', color: @france, colorL: @franceL, bank: 19,income: 19},
      ]
      nations.each do |n|
        Game.find_by(uuid: game_uuid).nations.create(n)
      end
    end

    def self.create_1940_Grasshopper(game_uuid)
      nations = [
        {nid: 0,name: 'Germany',roundel: 'germany.png',color: @germany,colorL: @germanyL,bank: 30,income: 30},
        {nid: 1,name: 'USSR',   roundel: 'ussr.png',   color: @ussr,   colorL: @ussrL,   bank: 37,income: 37},
        {nid: 2,name: 'Japan',  roundel: 'japan.png',  color: @japan,  colorL: @japanL,  bank: 26,income: 26},
        {nid: 3,name: 'USA',    roundel: 'usa.png',    color: @usa,    colorL: @usaL,    bank: 52,income: 52},
        {nid: 4,name: 'China',  roundel: 'china.png',  color: @china,  colorL: @chinaL,  bank: 12,income: 12},
        {nid: 5,name: 'Britain',roundel: 'britain.png',color: @britain,colorL: @britainL,bank: 28,income: 28},
        {nid: 6,name: 'Pacific',roundel: 'pacific.png',color: @britain,colorL: @britainL,bank: 17,income: 17},
        {nid: 7,name: 'Italy',  roundel: 'italy.png',  color: @italy,  colorL: @italyL,  bank: 10,income: 10},
        {nid: 8,name: 'ANZAC',  roundel: 'anzac.png',  color: @anzac,  colorL: @anzacL,  bank: 10,income: 10},
        {nid: 9,name: 'France', roundel: 'france.png', color: @france, colorL: @franceL, bank: 19,income: 19},
      ]
      nations.each do |n|
        Game.find_by(uuid: game_uuid).nations.create(n)
      end
    end

    def self.create_1942(game_uuid)
      nations = [
        {nid: 0,name: 'USSR',   roundel: 'ussr.png',   color: @ussr,   colorL: @ussrL,   bank: 24,income: 24},
        {nid: 1,name: 'Germany',roundel: 'germany.png',color: @germany,colorL: @germanyL,bank: 41,income: 41},
        {nid: 2,name: 'Britain',roundel: 'britain.png',color: @britain,colorL: @britainL,bank: 31,income: 31},
        {nid: 3,name: 'Japan',  roundel: 'japan.png',  color: @japan,  colorL: @japanL,  bank: 30,income: 30},
        {nid: 4,name: 'USA',    roundel: 'usa.png',    color: @usa,    colorL: @usaL,    bank: 42,income: 42},
      ]
      nations.each do |n|
        Game.find_by(uuid: game_uuid).nations.create(n)
      end
    end

    def self.create_1914(game_uuid)
      nations = [
        {nid: 0,name: 'Austria',       roundel: 'ussr.png',   color: '#40bf40',colorL: '#8cd98c',bank: 24,income: 24},
        {nid: 1,name: 'Russia',        roundel: 'germany.png',color: '#872323',colorL: '#d55d5d',bank: 41,income: 41},
        {nid: 2,name: 'Germany',       roundel: 'britain.png',color: '#282828',colorL: '#8a8d8f',bank: 31,income: 31},
        {nid: 3,name: 'France',        roundel: 'japan.png',  color: '#3e6d91',colorL: '#a6c3d9',bank: 30,income: 30},
        {nid: 4,name: 'Britain',       roundel: 'usa.png',    color: '#d4ac80',colorL: '#e4ceb4',bank: 42,income: 42},
        {nid: 5,name: 'Ottoman Empire',roundel: 'usa.png',    color: '#248f8f',colorL: '#80ffff',bank: 42,income: 42},
        {nid: 6,name: 'Italy',         roundel: 'usa.png',    color: '#754100',colorL: '#995f16',bank: 42,income: 42},
        {nid: 7,name: 'USA',         roundel: 'usa.png',    color: '#5a8232',colorL: '#a6cd7e',bank: 42,income: 42},
      ]
      nations.each do |n|
        Game.find_by(uuid: game_uuid).nations.create(n)
      end
    end

  private
    def create_uuid
      begin
        self.uuid = SecureRandom.uuid
      end while self.class.exists?(:uuid => uuid)
    end
end
