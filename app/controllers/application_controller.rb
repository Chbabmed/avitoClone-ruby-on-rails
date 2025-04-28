class ApplicationController < ActionController::Base
  layout :layout_by_resource
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern


  private

  def layout_by_resource
    if devise_controller? && (action_name == 'new' || action_name == 'create')
      "auth"
    else
      "application"
    end
  end

  def authenticate_user!
    unless user_signed_in? # This method is available in Devise
      redirect_to root_path, alert: "You must log in to access this page."
    end
  end


end
