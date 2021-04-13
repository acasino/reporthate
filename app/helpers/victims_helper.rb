module VictimsHelper

    def require_victim_login
        if !logged_in?
            flash[:error] = "Login required for access"
            redirect_to login_path
        elsif !is_victim?
            flash[:error] = "You must be registered as a victim to access"
            redirect_to login_path
        end
    end

end
