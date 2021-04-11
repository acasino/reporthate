class Victims::UsersController < ApplicationController

    def new
        @victim = Victim.new
    end

    def create
        @victim = Victim.new(user_params)
        if @victim.save
            session[:user_id] = @victim.id
            redirect_to victim_path(@victim)
        else
            render :new
        end
    end

    def index
        # redirect_to victim_path(current_user.id) #setup sessions first
    end

    def show

    end

    def update

    end

    def destroy

    end

    private

    def user_params
        params.require(:victim).permit(:name, :email, :password, :password_confirmation)
    end



end
