class Volunteers::UsersController < ApplicationController
    
    before_action :set_volunteer, only: [:show, :edit, :update, :destroy]

    def new
        @volunteer = Volunteer.new
    end

    def create
        @volunteer = Volunteer.new(user_params)
        if @volunteer.save
            session[:user_id] = @volunteer.id
            redirect_to volunteer_path(@volunteer)
        else
            render :new
        end
    end

    def index
        redirect_to volunteer_path(current_user.id) 
    end

    def show

    end

    def update
        @volunteer.update(user_params)
        redirect_to volunteer_path(@volunteer)
    end

    def destroy
        @volunteer.destroy
        redirect_to root_path
    end

    private

    def user_params
        params.require(:volunteer).permit(:name, :email, :language, :password, :password_confirmation)
    end

    def set_volunteer
        #setup if/else after session built for current_user
        @volunteer = Volunteer.find_by(id: params[:id])
    end

end
