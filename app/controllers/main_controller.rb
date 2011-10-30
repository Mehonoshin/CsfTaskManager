class MainController < ApplicationController
  # before_filter :check_auth
  before_filter :authenticate_user!
  
  def index
  end
  
  private
  
  def check_auth
    redirect_to new_session_path if !user_signed_in?
  end
end
