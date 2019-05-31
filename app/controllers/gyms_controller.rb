class GymsController < ApplicationController
    #before_action :authenticate_user!, except: [:index, :show]
    
    def index
        @gyms = Gym.all
    end

    def show
        @gym = Gym.find(params[:id])
    end

    def new
        @gym = Gym.new
    end

    def host_gyms
        if user_signed_in?
            redirect_to new_gym_path
        else 
            redirect_to new_user_session_path, alert: "Please login before creating a new reservation"
        end
    end

    def create
        @gym = Gym.new(gym_params)
        if @gym.save
            redirect_to gym_path(@gym)
        else
            render 'gym/new', alert: "Invalid Data, please try again."
        end
    end

    private

    def gym_params
        params.require(:gym).permit(:name, :description, :address_1, :address_2, :city, :state, :guests, :price, :owner_id)
    end
end
