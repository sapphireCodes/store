module ApplicationHelper
    def admin?
        user_signed_in && current_staff.try(:admin?)
    end
end
