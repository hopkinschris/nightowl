class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def current_user
    begin
      @current_user ||= User.find params[:id] if params[:id]
    rescue ActiveRecord::RecordNotFound
      nil
    end
  end

  def authenticate_user!
    if !current_user
      redirect_to root_url
    end
  end
end
