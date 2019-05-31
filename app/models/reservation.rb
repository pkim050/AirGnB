class Reservation < ApplicationRecord
    belongs_to :gym
    belongs_to :user

    validates_presence_of :name, :guests

    def self.reservations_by_user(user_id) 
        where(user_id: user_id)
    end

    def total_price
        if self.end_date && self.start_date
            "$#{self.gym.price.remove(/\D/).to_i*number_of_days}"   
        else 
            "Please specify a start and end date for your session to calculate a price!"
        end     
    end 

    def number_of_days
        if self.end_date
            (self.end_date.to_datetime - self.start_date.to_datetime).to_i
        else
            0
        end
    end
end
