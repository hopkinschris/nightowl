class DashboardController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user?

  def index
    @user = current_user

    if @user.waitlist == "true"
      flash[:notice] = "Thanks, you're now on the waitlist. We'll tweet you when your account is active"
      redirect_to waitlist_path
    else
      @keyword = Keyword.new
    end
  end
end
