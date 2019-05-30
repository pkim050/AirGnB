class Reservation < ApplicationRecord
    belongs_to :gym
    belongs_to :user

    validates_presence_of :name, :guests
end
