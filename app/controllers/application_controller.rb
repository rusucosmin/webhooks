class ApplicationController < ActionController::Base
  before_action :set_raven_context
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :school_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :school_name])
  end

  private

  def set_raven_context
    Raven.user_context(id: current_user.id) if current_user.present?
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end
end
