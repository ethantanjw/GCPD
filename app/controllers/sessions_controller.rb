class SessionsController < ApplicationController
    def new
    end

    def create
        officer = Officer.find_by_username(params[:username])
        if officer && officer.authenticate(params[:password])
            session[:officer_id] = officer.id
            flash[:notice] = "Welcome back, #{officer.first_name}!"
            redirect_to home_path
        else
            flash.now[:alert] = "Invalid username/password combination"
            render action: 'new'
        end
    end

    def destroy
        session[:officer_id] = nil
        flash[:notice] = "You have been logged out."
        redirect_to home_path
    end
end