class Team < ApplicationRecord
  default_scope { order(created_at: :asc) }
  belongs_to :battle_calculator
  has_many :units



    def current_units
      @count = 0
      self.units.all.each do |u|
        @count = @count + u.count
      end
      return @count
    end

    def dead_units
      return self.starting_units-current_units
    end
end
