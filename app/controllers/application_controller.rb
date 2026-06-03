class ApplicationController < ActionController::Base
  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  after_action :verify_authorized, unless: :skip_authorization?
  after_action :verify_policy_scoped, unless: :skip_policy_scoped?

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    # Permit username along with the default sign up keys
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :username ])

    # Permit username along with account update keys (editing profile)
    devise_parameter_sanitizer.permit(:account_update, keys: [ :username ])
  end

  private
  # Clean runtime filters to appease modern Rails versions
  def skip_authorization?
    devise_controller? || action_name == "index"
  end

  def skip_policy_scoped?
    devise_controller? || action_name != "index"
  end
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
