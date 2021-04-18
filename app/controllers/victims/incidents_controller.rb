class Victims::IncidentsController < ApplicationController
    include VictimsHelper

    before_action :verify_user
    before_action :set_incident, only: [:show, :edit, :update, :destroy]

    def index
        @incidents = @victim.incidents
    end

    def new
        if params[:victim_id] && @victim = Victim.find_by(id: params[:victim_id])
            @incident = @victim.incidents.build
        else
            @incident = Incident.new
            # @incident = @victim.incidents.build
            # @incidents = @victim.incidents
        end
    end

    def create
        @incident = @victim.incidents.build(incident_params)
        if @incident.save
            redirect_to victim_path(@incident.victim)
            # redirect_to victim_incidents_path(@victim)
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    ### TEST
    def update
        #need to find incident but it's nested
        # incident = Incident.find_by(id: params[:id])
        # incident.update(incident_params)
        @incident.update(incident_params)
        redirect_to victim_path(@victim)
        # redirect_to victim_incidents_path(@victim)
    end

    def destroy
        @incident.destroy
        redirect_to victim_path(@victim)
    end

    private

    def incident_params
        params.require(:incident).permit(:description, :location, :time_occurred, :request_translator, :contact_status, :language, :volunteer_id, :victim_id)
    end

    def verify_user
        if current_user != Victim.find_by(id: params[:victim_id])
            flash[:error] = "Something went wrong"
            redirect_to victim_path(current_user.id)
        else
            @victim = Victim.find_by(id: params[:victim_id])
        end
    end

    def set_incident
        @incident = @victim.incidents.find(params[:id])
    end

end