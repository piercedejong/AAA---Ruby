class BattleCalculator < ApplicationRecord
  belongs_to :user
  has_many :teams
end
