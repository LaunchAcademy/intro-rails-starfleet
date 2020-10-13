class Starship < ApplicationRecord
  validates :name, presence: true
  validates :ship_class, presence: true
  validates :location, presence: true
end