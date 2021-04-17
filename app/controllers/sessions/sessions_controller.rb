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

    def omniauth
        
        user_email = request.env['omniauth.auth']['info']['email']
        user_name = request.env['omniauth.auth']['info']['name']
        @volunteer = Volunteer.find_or_create_by(email: user_email) do |user|
          user.name = user_name
          user.password = SecureRandom.hex
        end
        if @volunteer.valid?
            session[:user_id] = @volunteer.id
            session[:user_type] = :volunteer
            redirect_to volunteer_path(@volunteer)
        else
        render :new
        end

    end

    def logout
        session.clear
        redirect_to root_path
    end

    private 

    def auth
        request.env['omniauth.auth']
    end

end