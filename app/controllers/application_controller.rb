class ApplicationController < ActionController::Base
  # Set layout dynamically based on controller and action
  layout :layout_by_resource

  # Ensure only modern browsers can access
  allow_browser versions: :modern

  # Devise: Allow strong parameters for user model
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Ensure users are authenticated before accessing their pages
  before_action :authenticate_user!, unless: :devise_controller?

  private

  # Dynamically set layout based on the controller and action
  def layout_by_resource
    # Use "auth" layout for Devise's new or create actions, else default to "application"
    if devise_controller? && (action_name == "new" || action_name == "create")
      "auth"
    else
      "application"
    end
  end

  # Restrict access to logged-in users only
  def authenticate_user!
    unless user_signed_in?
      # Redirect unauthenticated users to login page
      redirect_to new_user_session_path, alert: "You must log in to access this page."
    end
  end

  # Configure custom fields for Devise's strong parameter sanitization
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name, :phone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :last_name, :phone])
  end
end