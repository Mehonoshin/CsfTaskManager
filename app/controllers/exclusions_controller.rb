class ExclusionsController < ApplicationController
  before_filter :preload_goal
  
  def create
    ex = @goal.exclusions.create!(params[:exclusion])
    render :json => ex.to_json
  end
  
  def update
    ex = @goal.exclusions.find(params[:exclusion][:id])
    ex.update_attributes(params[:exclusion])
    render :json => ex.to_json
  end
  
  def destroy
    @goal.exclusions.find(params[:id]).destroy
    render :nothing => true
  end
  
  private
  
  def preload_goal
    @goal = Goal.find(params[:goal_id])
    unless current_user == @goal.user
      raise "Access Denied"
    end
  end
  
end
