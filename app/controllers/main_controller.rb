class MainController < ApplicationController
  before_filter :authenticate_user!, :except => [:auth]
  
  def index
    @week_start, @week_end = Time.now.beginning_of_week, Time.now.end_of_week

    @roles = current_user.roles
    @this_week_goals = current_user.goals.this_week(@week_start, @week_end)
    @month_tasks = current_user.goals.map { |goal| {:title => goal.title, :start => goal.date.strftime('%Y-%m-%d')} }
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
