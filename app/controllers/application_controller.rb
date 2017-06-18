class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def admin_required
    if !current_user.admin?
      redirect_to "/", warning: "You are not admin!"
    end
  end

  before_action :store_current_location, :unless => :devise_controller?

private

def store_current_location
  store_location_for(:user, request.url)
end
end
