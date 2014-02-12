class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user = User.find params[:id]
  end
end
