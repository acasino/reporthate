class Sessions::SessionsController < ApplicationController

    def create
        @victim = Victim.find_by(email: params[:email])
        @volunteer = Volunteer.find_by(email: params[:email])
        if @victim && @victim.authenticate(params[:password])
            session[:user_id] = @victim.id
            session[:user_type] = :victim
            redirect_to victim_path(@victim)
        elsif @volunteer && @volunteer.authenticate(params[:password])
            session[:user_id] = @volunteer.id
            session[:user_type] = :volunteer
            redirect_to volunteer_path(@volunteer)
        else
            flash[:error] = "Incorrect Username or Password"
            redirect_to root_path
        end
    end

    def logout
        session.clear
        redirect_to root_path
    end

    # def google_login  #for third party login

    # end


end