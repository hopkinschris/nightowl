class DashboardController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user?

  def index
    @user = current_user
    @count = total_impression_count

    if @user.waitlist == "true"
      flash[:notice] = "Thanks, you're now on the waitlist. We'll tweet you when your account is active"
      redirect_to waitlist_path
    else
      @keyword = Keyword.new
    end
  end

  private

  def total_impression_count
    count = 0

    @user.keywords.each do |k|
      count += k.impression_count
    end

    return count
  end
end
