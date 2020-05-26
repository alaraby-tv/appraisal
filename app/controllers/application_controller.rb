class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :admin])
  end

  private

  def authenticate_admin
    redirect_to root_path, flash: { error: "You don't have permission for this action." } unless current_user.admin
  end
end
