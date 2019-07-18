class Team < ApplicationRecord
  belongs_to :battle_calculator
  has_many :units
end
