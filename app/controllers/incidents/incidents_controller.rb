class IncidentsController < ApplicationController

    def index
        @incidents = Incident.all
    end

    def show
        
    end

end
