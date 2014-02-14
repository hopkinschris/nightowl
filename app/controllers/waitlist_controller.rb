class WaitlistController < ApplicationController
  def index
    @users = User.inactive
  end
end
