class Victims::IncidentsController < ApplicationController
    include VictimsHelper

    def new
        # if params[:victim_id] && @victim.incidents.exists?
        #     redirect_to victim_path(@victim), flash: { error: "You've already created this incident"}
        # else
            @incident = Incident.new()
            # @incidents = @victim.incidents
        # end
    end

    def create

    end

    def show

    end

    def edit

    end

    def update

    end

    def destroy

    end

    private

    def incident_params

    end

    def verify_user

    end

end