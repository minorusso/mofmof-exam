class Room < ApplicationRecord
    validates :name, presence: true
    validates :rent, presence: true
    validates :address, presence: true
    validates :age, presence: true
end
