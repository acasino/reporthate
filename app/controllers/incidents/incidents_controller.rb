class Incidents::IncidentsController < ApplicationController
    include IncidentsHelper

    # before_action :set_user
    before_action :require_volunteer_login
    before_action :set_incident, only: [:show, :update]

    def index
        @incidents = Incident.all
    end

    def show
        # if which_user? == "victim"
        #     @victim = Victim.find_by(id: params[:id])
        # elsif which_user? == "volunteer"
        #     @volunteer = Volunteer.find_by(id: params[:id])
        # end
    end

    def not_yet_contacted
        @incidents = Incident.not_yet_contacted
        render action: :index
    end

    def time_occurred_desc
        @incidents = Incident.time_occurred_desc
        render action: :index
    end

    def update
        @incident.update(incident_params)
        redirect_to incident_path(@incident)
    end

    private

    def incident_params
        params.require(:incident).permit(:volunteer_id, :notes)
    end

    def set_incident
        @incident = Incident.find_by_id(params[:id])
    end

    # def set_user
    #     #setup if/else after session built for current_user
    #     if current_user != Victim.find_by(id: params[:id])
    #         flash[:error] = "Oops! Something went wrong"
    #         redirect_to login_path
    #     else
    #         @victim = Victim.find_by(id: params[:id])
    #     end
    # end

    # def set_user
    #     byebug
    #     if session[:user_type] = 'volunteer'
    #         @volunteer = Volunteer.find_by(id: params[:id])
    #     elsif session[:user_type] = 'victim'
    #         @victim = Victim.find_by(id: params[:id])
    #     end
    #     byebug
    # end

    # def set_user
    #     byebug
    #     if session[:user_type] = 'volunteer'
    #         @volunteer = Volunteer.find_by(id: current_user[:id])
    #     elsif session[:user_type] = 'victim'
    #         @victim = Victim.find_by(id: current_user[:id])
    #     end
    #     byebug
    # end

    # def set_user
    #     if session[:user_type] = 'volunteer'
    #         @volunteer = Volunteer.find_by(id: current_user[:id])
    #     elsif session[:user_type] = 'victim'
    #         @victim = Victim.find_by(id: current_user[:id])
    #     end
    # end
end

