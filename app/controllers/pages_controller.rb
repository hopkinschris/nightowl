class PagesController < ApplicationController
  def home
    @waitlisters = User.inactive
  end
end
