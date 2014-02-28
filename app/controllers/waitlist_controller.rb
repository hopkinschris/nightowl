class WaitlistController < ApplicationController
  def index
    @users = User.inactive.sort_by(&:created_at)
  end
end
