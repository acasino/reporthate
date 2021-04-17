module IncidentsHelper

    def require_volunteer_login
        if !logged_in?
          flash[:error] = "You must be logged in to access this section"
          redirect_to login_path
        elsif !is_volunteer?
          flash[:error] = "You must be registered as a volunteer to access this section"
          redirect_to victim_path(current_user.id)
        end
    end

end
