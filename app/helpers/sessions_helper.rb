module SessionsHelper

    def current_user
        if is_volunteer?
            @current_user ||= Volunteer.find_by(id: session[:user_id])
        elsif is_victim?
            @current_user ||= Victim.find_by(id: session[:user_id])
        end
    end

    def logged_in?
        !!current_user
    end

    def logout!
        session.clear
    end

    def which_user?
        session[:user_type]
    end

    def is_volunteer?
        which_user? == "volunteer"
    end

    def is_victim?
        which_user? == "victim"
    end

end