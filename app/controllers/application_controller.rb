class ApplicationController < ActionController::Base
  protect_from_forgery

  def authorize_admin!
    unless current_user.admin?
      redirect_to root_path, alert: "Sorry, you don't have enough permissions"
    end
  end
end
