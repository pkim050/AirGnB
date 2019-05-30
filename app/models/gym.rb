class Gym < ApplicationRecord
    has_many :reservations
    has_many :users, through: :reservations

    validates_presence_of :name, :description, :address_1, :city, :state, :guests, :price
end
