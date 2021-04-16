class Incidents::IncidentsController < ApplicationController

    before_action :set_incident, only: [:show]

    def index
        @incidents = Incident.all
    end

    def show
    end

    private

    def set_incident
        @incident = Incident.find_by_id(params[:id])
    end

end
