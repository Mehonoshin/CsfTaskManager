class MainController < ApplicationController
  before_filter :authenticate_user!, :except => [:auth]
  
  def index
    @roles = current_user.roles
    @goals = current_user.goals
  end
  
  def auth
    username = params[:username]
    user = User.find_by_email(username)
    if sign_in(user)
      render :json => session.to_json
    end
  end    
  
  private
  
end
