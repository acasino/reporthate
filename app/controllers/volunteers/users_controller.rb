class Volunteers::UsersController < ApplicationController
    include VolunteersHelper
    
    before_action :require_volunteer_login, except: [:login, :new, :create]
    before_action :set_volunteer, only: [:show, :edit, :update, :destroy]

    def new
        @volunteer = Volunteer.new
    end

    def create
        @volunteer = Volunteer.new(user_params)
        if @volunteer.save
            session[:user_id] = @volunteer.id
            session[:user_type] = :volunteer
            redirect_to volunteer_path(@volunteer)
        else
            render :new
        end
    end

    def index
        redirect_to volunteer_path(current_user.id) 
    end

    def show
        @volunteered_count = @volunteer.volunteered_count
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
        if current_user != Volunteer.find_by(id: params[:id])
            flash[:error] = "Oops! Something went wrong"
            redirect_to login_path        
        else 
            @volunteer = Volunteer.find_by(id: params[:id])
        end
    end

end
