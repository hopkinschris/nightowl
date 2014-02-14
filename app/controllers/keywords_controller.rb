class KeywordsController < ApplicationController
  def create
    if @keyword = Keyword.create!(name: params[:keyword][:name], user_id: params[:keyword][:user_id])
      redirect_to :back
    end
  end
end
