class GymsController < ApplicationController
    #before_action :authenticate_user!, except: [:index, :show]
    
    def index
        @gyms = Gym.all
    end

    def show
        @gym = Gym.find(params[:id])
    end

    private

    def gym_params
        params.require(:gym).permit(:name, :description, :address_1, :address_2, :city, :state, :guests, :price, :owner_id)
    end
end
