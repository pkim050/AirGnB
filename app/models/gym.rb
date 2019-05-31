class Gym < ApplicationRecord
    has_many :users, through: :reservations
    has_many_attached :avatars

    validates_presence_of :name, :description, :address_1, :city, :state, :guests, :price

    def self.search(search)
        where('name LIKE ?', "%#{search}%")
    end
end
