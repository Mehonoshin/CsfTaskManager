class AuthenticationsController < Devise::SessionsController
  
  # Custom authentication for mobile apps
  def create
    respond_to do |format|
      format.json { 
        user = User.find_by_email(params[:email])
        if user.valid_password?(params[:password])
          sign_in(user)
          render :json => session.to_json 
        end
      }
      format.html { super }
    end
  end
  
end
