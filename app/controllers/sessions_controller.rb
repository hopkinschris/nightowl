class SessionsController < ApplicationController
  def create
    user = User.find_by_uid(auth_hash['uid']) || User.create_from_auth_hash(auth_hash)
    redirect_to dashboard_path(user.id)
  end

  def destroy
    reset_session
    flash[:notice] = "See you soon"
    redirect_to root_url
  end

  def new
    redirect_to '/auth/twitter'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
