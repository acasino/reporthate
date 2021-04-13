class Victims::IncidentsController < ApplicationController
    include VictimsHelper

    def new
        # if params[:victim_id] && @victim.incidents.exists?
        #     redirect_to victim_path(@victim), flash: { error: "You've already created this incident"}
        # else
            @incident = Incident.new
            # @incidents = @victim.incidents
        # end
    end

    def create

    end

    def show
        redirect_to victim_path(@victim)
    end

    def edit

    end

    def update

    end

    def destroy
        @victim.incidents.destroy
        redirect_to victim_path(@victim)
    end

    private

    def incident_params

    end

    def verify_user
        if current_user != Victim.find_by(id: params[:victim_id])
            flash[:error] = "Something went wrong"
            redirect_to victim_path(current_user.id)
        else
            @victim = Victim.find_by(id: params[:needy_id])
        end
    end

end