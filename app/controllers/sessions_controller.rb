class SessionsController < ApplicationController
  def create
    user = CreateUser.from_unknown_auth_source(auth_hash)

    if user.valid?
      auto_login(user)
      redirect_to dashboard_path, :notice => "Signed in"
    else
      redirect_to root_path, :notice => "Failed to sign in."
    end
  end

  def error
    redirect_to root_path, :notice => "Error"
  end

private

  def auth_hash
    request.env['omniauth.auth']
  end
end