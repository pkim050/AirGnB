class ReservationsController < ApplicationController
    before_action :set_reservation, only: [:new, :create]
    before_action :authenticate_user!, only: [:new, :create, :confirmation]
end
