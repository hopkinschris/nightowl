class KeywordsController < ApplicationController
  def create
    if @user = User.find(params[:keyword][:user_id])
      if @user.keywords.count >= 3
        flash[:alert] = "Sorry, free accounts have a three keyword max"
        redirect_to :back
      else
        if @keyword = @user.keywords.build(name: params[:keyword][:name])
          redirect_to :back
        end
      end
    end
  end
end
