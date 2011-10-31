class GoalsController < ApplicationController
  def create
    goal = Goal.create(params[:goal])
    render :json => goal.to_json
  end
  
  def update
  end
  
  def index
    render :json => current_user.goals.to_json
  end
  
  def destroy    
  end
end
