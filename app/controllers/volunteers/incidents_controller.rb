class Volunteers::IncidentsController < ApplicationController
    include VolunteersHelper

    before_action :verify_user
    # before_action :set_incident, only: [:show, :edit, :update]

    def index
        @incidents = Incident.all
    end

    def show

    end

    def edit
        byebug
    end

    def update

    end

    private

    def incident_params
        params.require(:incident).permit(:description, :location, :time_occurred, :request_translator, :contact_status, :language, :volunteer_id, :victim_id, :notes)
    end

    def verify_user
        if current_user != Volunteer.find_by(id: params[:volunteer_id])
            flash[:error] = "Something went wrong"
            redirect_to volunteer_path(current_user.id)
        else
            @volunteer = Volunteer.find_by(id: params[:volunteer_id])
        end
    end

    # def set_incident
    #     @incident = @victim.incidents.find(params[:id])
    # end


end