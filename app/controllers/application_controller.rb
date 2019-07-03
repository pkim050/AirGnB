class ApplicationController < ActionController::Base
    include Pundit
    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?
    
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    def home
    end

    def authenticate_user
        render json: {id: current_user.id}
    end

    private
    def user_not_authorized
        flash[:alert] = "You are not authorized to perform this action!"
        redirect_to(request.referrer || root_path)
    end

    protected

    #def after_sign_up_path_for(resource)
    #    new_user_profile_path(@user)
    #end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar])
    end
end
