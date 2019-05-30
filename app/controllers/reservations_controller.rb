class ReservationsController < ApplicationController
    
    def new
        if user_signed_in? && params[:gym_id]
            @reservation = Reservation.new(gym_id: params[:gym_id], user_id: current_user.id)
        else 
            redirect_to new_user_session_path, alert: "Please login before creating a new reservation"
        end
                
    end

    def create
        @reservation = Reservation.new(reservation_params)
        if @reservation.save 
            gym = gym.find_by(id: @reservation.gym_id)
            gym.save
            redirect_to user_reservation_path(current_user.id, @reservation)
        else
            render 'reservations/new', alert: "Invalid Data, please try again."
        end
    end
    

    def show 
        @reservation = reservation.find(params[:id])
    end

    def index
        if !user_signed_in? 
            redirect_to new_user_session_path, alert: "Please SignIn to see your reservations or to create new reservations!"
        elsif user_signed_in? && params[:gym_id]
           gym = gym.find(params[:gym_id])
           @reservations = gym.reservations
        elsif user_signed_in?
            @reservations = Reservation.reservations_by_user(current_user.id)
        else 
            redirect_to '', alert: "You do not have permission to view this page!"
        end
    end

    def edit 
        @reservation = reservation.find(params[:id])
        if user_signed_in? && @reservation.user_id == current_user.id
            @reservation
        else 
            redirect_to '', alert: "You don't have permission to edit this reservation."
        end 
    end

    def update 
        @reservation = reservation.find(params[:id])
        if @reservation.update(reservation_params)
            redirect_to user_reservation_path(current_user.id, @reservation.id)
        else 
            render 'edit'
        end
    end

    def destroy
        reservation.find(params[:id]).destroy
        redirect_to user_reservations_path(current_user.id)
    end

    private 

    def reservation_params
        params.require(:reservation).permit(:name, :start_date, :end_date, :guests, :user_id, :gym_id)
    end
end