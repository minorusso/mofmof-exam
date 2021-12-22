class Room < ApplicationRecord
    has_many :stations, dependent: :destroy
    accepts_nested_attributes_for :stations, allow_destroy: true, reject_if: :all_blank
    validates :name, presence: true
    validates :rent, numericality: true
    validates :address, presence: true
    validates :age, numericality: true
end
