class RolesController < ApplicationController
  
  def create
    current_user.roles.create(params[:role])
    render :json => current_user.roles.last.to_json
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
  def index
    render :json => current_user.roles.to_json
  end
  
end
