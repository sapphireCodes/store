class ApplicationController < ActionController::Base
  before_action :authorized
  helper_method :current_user
  helper_method :user_signed_in
  helper_method :current_staff
  def current_user
    if session[:customer_id]
      @current_user=Customer.find(session[:customer_id])
    else
      @current_user=nil
    end
  end
  def current_staff
    if session[:user_id]
      @current_staff=User.find(session[:user_id])
    else
      @current_staff=nil
    end
  end

  def authorized
    redirect_to root_url unless !current_user.nil?
  end

  def user_signed_in
    redirect_to root_url unless !current_staff.nil?
  end
  def admin?
    user_signed_in && current_staff.try(:admin?)
end
end