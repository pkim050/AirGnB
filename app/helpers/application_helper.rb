module ApplicationHelper
    def has_profile?
        current_user.profile != nil
    end
end
