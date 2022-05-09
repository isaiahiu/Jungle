class SessionsController < ApplicationController

  def new  
  end

def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      session[:user_id] = user.id
      # logged in when they navigate around our website.
      redirect_to root_path
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
