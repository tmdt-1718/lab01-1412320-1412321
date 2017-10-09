class Auth::CallbacksController < ApplicationController
  skip_before_action :authenticate_user!
  def facebook
    user = User.create_from_omniauth(omniauth_params)
    if user
      p user
      sign_in(:user, user)
      redirect_to :root
    else
      redirect_to :root
    end
  end
  
  def failure
    redirect_to :root
  end
  
  private
  def omniauth_params
    request.env["omniauth.auth"]
  end
end
