class ApplicationController < ActionController::Base
  def index
    @users = User.all
  end
end
