class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception



  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  protected

  def configure_devise_permitted_parameters
    registration_params = [:first_name,:last_name, :email, :password, :password_confirmation]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) {
          |u| u.permit(registration_params << :current_password)
      }
    elsif params[:action] == 'create'
      ## we have added one layer of security i:e if user have't fill the correct security code
      ## immediately redirect to sigh up page. As for now this functionality id hard coded but in
      ## in future this will be dynamic :) :) .

      if (params[:challenge_secure_code] == params[:response_secure_code])
          devise_parameter_sanitizer.for(:sign_up) {
              |u| u.permit(registration_params)
          }
      else
          flash[:custom_notice] = 'Security Code in not correct'
          redirect_to :back
      end
    end
  end
end
