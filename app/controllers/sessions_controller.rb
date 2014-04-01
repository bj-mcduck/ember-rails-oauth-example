class SessionsController < ApplicationController
  def new
  end

  def create
    auth = env["omniauth.auth"]
    notice = ""

    if current_user
      @user = current_user
      User.add_omniauth_to_user(auth, @user)
      notice << "Authentication added successfully."
    else
      @user = User.from_omniauth( auth )
      params[:omni] = env["omniauth.auth"]
      session[:user_id] = @user.id
      notice << " been signed in!"
    end
  end

  def destroy
    session[:user_id] = nil
    # session[:omni] = nil
    redirect_to root_url, notice: "Signed out!"
  end

  def failure
    redirect_to root_url, alert: "Authentication failed, please try again."
  end
end