class UsersController < ApplicationController
    before_action :authenticate_user!
 
    def show
       @user = current_user
    end

    def user_info
      @user = current_user
      render json: @user, status: 201
    end
 end