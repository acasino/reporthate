class Victims::IncidentsController < ApplicationController
    include VictimsHelper

    before_action :verify_user

    def new
        # if params[:victim_id] && @victim.incidents.exists?
        #     redirect_to victim_path(@victim), flash: { error: "You've already created this incident"}
        # else
            @incident = Incident.new
            # @incidents = @victim.incidents
        # end
    end

    def create
        @victim.incidents.build(incident_params)
        if @victim.save
            redirect_to victim_path(@victim)
        else
            render :new
        end

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
        params.permit(:description, :location, :time_occurred, :request_translator, :contact_status, :language, :volunteer_id, :victim_id)
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