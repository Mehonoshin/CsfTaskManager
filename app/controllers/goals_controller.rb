class GoalsController < ApplicationController
  def create    
    params[:goal][:date] = params[:goal][:date].to_datetime    
    current_user.goals.create(params[:goal])
    render :json => current_user.goals.last.to_json
  end
  
  def update
  end
  
  def index
    render :json => current_user.goals.to_json
  end
  
  def destroy    
  end
end
