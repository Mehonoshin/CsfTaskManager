class MainController < ApplicationController
  def index
    render :text => "Hello heroku!"
  end
end
