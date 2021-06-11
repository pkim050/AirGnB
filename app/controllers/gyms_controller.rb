class GymsController < ApplicationController
    #before_action :authenticate_user!, except: [:index, :show]
    

    def search
        if params[:search].nil? || params[:search] == ""
            @gyms = Gym.all
        else
            @gyms = Gym.search(params[:search])
        end
    end

    def index
        @gyms = Gym.all
        respond_to do |format|
            format.html {render :index}
            format.json {render json: @gyms, status: 201}
        end
    end

    def show
        @gym = Gym.find_by_id(params[:id])
        respond_to do |format|
            format.html {render :show}
            format.json {render json: @gym, status: 201}
        end
    end

    def new
        @gym = Gym.new
    end

    def edit
        @gym = Gym.find_by_id(params[:id])
    end

    def update
        @gym = Gym.find_by_id(params[:id])
        if @gym.update(gym_params)
            redirect_to host_gyms_path(current_user.id)
        else 
            render 'edit'
        end
    end

    def host_gyms
        if user_signed_in?
            @gyms = Gym.all.where(owner_id: current_user.id)
            if !@gyms
                render :new
            end
        else 
            redirect_to new_user_session_path, alert: "Please login before creating a new host page!"
        end
    end

    def create
        @gym = Gym.new(gym_params)
        uploaded_io = params[:gym][:avatar]
        File.open(Rails.root.join('app', 'assets', 'images', uploaded_io.original_filename), 'wb') do |file|
            file.write(uploaded_io.read)
        end
        @gym.filename = uploaded_io.original_filename
        if @gym.save
            respond_to do |format|
                format.html {render :show}
                format.json {render json: @gym, status: 201}
            end
        else
            redirect_to new_gym_path, alert: "Invalid Data, please try again!"
        end
    end

    def destroy
        @temp = Gym.find_by_id(params[:id])
        if @temp.present?
            @temp.destroy
        end
        redirect_to host_gyms_path
    end

    private

    def gym_params
        params.require(:gym).permit(:name, :description, :address_1, :address_2, :city, :state, :guests, :price, :owner_id)
    end
end
