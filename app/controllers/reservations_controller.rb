class ReservationsController < ApplicationController
    def new
        if user_signed_in? && params[:reservation_id]
            @reservation = Reservation.new(gym_id: params[:gym_id], user_id: current_user.id)
        else 
            redirect_to new_user_session_path, alert: "Please login before creating a new reservation"
        end
                
    end

    def create
        @gym = gym.new(gym_params)
        if @gym.save 
            reservation = reservation.find_by(id: @gym.reservation_id)
            reservation.gym_count += 1 
            reservation.save
            redirect_to user_gym_path(current_user.id, @gym)
        else
            render 'gyms/new', alert: "Invalid Data, please try again."
        end
    end
    

    def show 
        @gym = gym.find(params[:id])
    end

    def index
        if !user_signed_in? 
            redirect_to new_user_session_path, alert: "Please Sign In to see gyms or to create new gyms!"
        elsif user_signed_in? && params[:reservation_id]
           reservation = reservation.find(params[:reservation_id])
           @gyms = reservation.gyms
        elsif user_signed_in?
            @gyms = gym.gyms_by_user(current_user.id)
        else 
            redirect_to '', alert: "You do not have permission to view this page!"
        end
    end

    def edit 
        @gym = gym.find(params[:id])
        if user_signed_in? && @gym.user_id == current_user.id
            @gym
        else 
            redirect_to '', alert: "You don't have permission to edit this gym."
        end 
    end

    def update 
        @gym = gym.find(params[:id])
        if @gym.update(gym_params)
            redirect_to user_gym_path(current_user.id, @gym.id)
        else 
            render 'edit'
        end
    end

    def destroy
        gym.find(params[:id]).destroy
        redirect_to user_gyms_path(current_user.id)
    end

    private 

        def gym_params
            params.require(:gym).permit(:name, :start_date, :end_date, :guests, :user_id, :reservation_id)
        end
end