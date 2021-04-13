module VolunteersHelper

    def require_volunteer_login
        if !logged_in?
            flash[:error] = "Login required for access"
            redirect_to login_path
        elsif !is_volunteer?
            flash[:error] = "You must be a registered Volunteer to access"
            redirect_to login_path
        end
    end

end
