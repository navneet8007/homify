class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    devise_group :user, contains: [:expert, :novice]
    before_action :configure_permitted_parameters, if: :devise_controller?


	  def after_sign_in_path_for(_resource_or_scope)
	    dashboard_index_path
	  end

	  def after_sign_out_path_for(resource_or_scope)
	    root_path
	  end

    protected

	def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:user_type,:username, :email, :password,:status, :password_confirmation, expert_fields: [:profession, :service]) }
	    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :current_password, :status) }
	end
end
