class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user = current_user
    @keyword = Keyword.new
  end
end
