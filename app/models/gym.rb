class Gym < ApplicationRecord
    belongs_to :user
    has_many :reservations, dependent: :destroy #Easier to destroy when needed.
    has_many :available_dates, dependent: :destroy
    has_many :gym_images, dependent: :destroy
    accepts_nested_attributes_for :gym_images, allow_destroy: true

    validates_presence_of :name, :description, :address_1, :city, :state, :guests, :price

    geocoded_by :full_street_address
    after_validation :geocode, if: ->(obj){ obj.address_1.present? and obj.address_changed? }

    scope :nearby, ->(address) { near(address, 50) if address.present? }
    scope :with_available_dates, ->(date_range_array) { 
        joins(:available_dates).merge(AvailableDate.available_for_reservation(date_range_array)) if date_range_array.present? }

    scope :with_guests, ->(no_of_guests) { where(guests: no_of_guests) if no_of_guests.present? }

    def full_street_address
        [address_1, city, state].compact.join(", ")
    end

    def address_changed?
        address_1_changed? || city_changed? || state_changed? 
    end

    def create_available_dates(start_date, end_date)
        dates = start_date.to_date.upto(end_date.to_date)
        dates.each do |date|
        AvailableDate.find_or_create_by(available_date: date, gym_id: self.id, booked: false)
        end
    end

    def future_booked_dates
        self.reservations.where("end_date >= ?", Date.today)
    end

    def future_available_dates
        future_dates = AvailableDate.where("available_date >= ?", Date.today).where(location: self)
        future_dates.where(booked: false)
    end
end
