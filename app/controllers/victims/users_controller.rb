class Victims::UsersController < ApplicationController

    before_action :set_victim, only: [:show, :edit, :update, :destroy]

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
        @victim.update(user_params)
        redirect_to victim_path(@victim)
    end

    def destroy
        @victim.destroy
        redirect_to root_path
    end

    private

    def user_params
        params.require(:victim).permit(:name, :email, :password, :password_confirmation)
    end

    def set_victim
        #setup if/else after session built
        @victim = Victim.find_by(id: params[:id])
    end

end
