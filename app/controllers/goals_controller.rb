class GoalsController < ApplicationController
  def create
    goal = Goal.create(params[:goal])
    goal.user_id = current_user.id
    goal.save
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
