class ProfilesController < ApplicationController
    before_action :authenticate_user!

    def index
        @profiles = Profile.all
    end

    def new
        @profile = @user.build_profile
        authorize @profile
    end

    def show
        @profile = Profile.find(params[:id])
        authorize @profile
    end

    def create
        @profile = @user.create_profile(profile_params)
        authorize @profile
        redirect_to user_profile_path(@user, @profile), notice: "You sucessfully created your profile." and return if @profile.save
        flash[:alert] = "Could not create your profile."
        render :new
    end

    def edit
        @profile = Profile.find(params[:id])
        authorize @profile
    end

    def update
        @profile = Profile.find(params[:id])
        authorize @profile
        redirect_to user_profile_path(@user, @profile), notice: "You successfully updated your profile." and return if @profile.update(profile_params)
        flash[:alert] = "Could not update your profile."
        render :edit
    end

    private

    def profile_params
        params.required(:profile).permit(:name, :bio, :user_id, :profile_pic)
    end

    def set_user
        @user = User.find(params[:user_id])
    end
end
