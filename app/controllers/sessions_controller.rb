class SessionsController < ApplicationController
  def create
    user = User.find_by_uid(auth_hash['uid']) || User.create_from_auth_hash(auth_hash)
    redirect_to dashboard_path(user.id)
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
