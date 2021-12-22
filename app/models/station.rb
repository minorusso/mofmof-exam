class Station < ApplicationRecord
  belongs_to :room
  validates :line, presence: true
  validates :station, presence: true
  validates :on_foot, numericality: true
end
