class Team < ApplicationRecord
  default_scope { order(created_at: :asc) }
  belongs_to :battle_calculator
  has_many :units
end
