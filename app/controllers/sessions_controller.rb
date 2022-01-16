class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new,:create,:staffnew,:staffcreate,:staffdestroy]
  def new
  end
  def staffnew
  end
  def create
    customer=Customer.find_by_email(params[:email])
    if customer && customer.authenticate(params[:password])
      session[:customer_id]=customer.id
      puts session[:customer_id]
      redirect_to root_url, notice: "Successfully Logged In!"
    else
      flash.now[:alert]="Invalid Email or Password given"
      render "new"
    end

  end
  def staffcreate
    user=User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id]=user.id
      redirect_to root_url, notice: "#{user.name} successfully Logged In!"
    else
      flash.now[:alert]="Invalid Email or Password given"
      render "staffnew"
    end
  end

  def destroy
    session[:customer_id]=nil
    redirect_to root_url, notice: "Logged out!"
  end
  def staffdestroy
    session[:user_id]=nil
    redirect_to root_url, notice: "User logged out!"
  end
end
