class Reservation < ApplicationRecord
    belongs_to :gym
    belongs_to :user

    validates_presence_of :name, :guests

    def self.reservations_by_user(user_id) 
        where(user_id: user_id)
    end
end
