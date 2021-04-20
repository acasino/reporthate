class Incidents::IncidentsController < ApplicationController
    include IncidentsHelper

    before_action :require_volunteer_login
    before_action :set_incident, only: [:show, :update]
    before_action :set_victim, only: [:show, :update]

    def index
        @incidents = Incident.all
        if params[:search]
            @search_term = params[:search]
            @incidents = @incidents.search_by(@search_term)
        end
    end

    def show
    end

    def not_yet_contacted
        @incidents = Incident.not_yet_contacted
        render action: :index
    end

    def not_yet_assigned
        @incidents = Incident.not_yet_assigned
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

    def set_victim
        @victim = Victim.find_by(id: @incident.victim_id)
    end


end

