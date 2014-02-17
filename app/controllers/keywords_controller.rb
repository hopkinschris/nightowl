class KeywordsController < ApplicationController
  def create
    if @user = User.find(params[:keyword][:user_id])
      if @user.keywords.count >= 3
        flash[:alert] = "Sorry, free accounts have a three keyword max"
        redirect_to :back
      else
        @user.keywords.build(name: params[:keyword][:name])
        @user.save

        redirect_to :back
      end
    end
  end

  def update
    @keyword = Keyword.find params[:id]
    if @keyword.update params[:keyword]
      flash[:notice] = "Successfully updated <br>#{ @keyword.name }".html_safe
      redirect_to :back
    else
      flash[:alert] = "Something went wrong :("
      redirect_to :back
    end
  end

  def destroy
    @keyword = Keyword.find params[:id]
    @keyword.destroy

    flash[:notice] = "Successfully destroyed <br>#{ @keyword.name }".html_safe
    redirect_to :back
  end
end
