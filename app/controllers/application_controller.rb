class ApplicationController < ActionController::Base
    def current_user
        User.find(session[:user_id]) if session[:user_id]
    end

    helper_method :current_user

    private
        def require_login
            redirect_to '/users/new' unless current_user
        end
end
