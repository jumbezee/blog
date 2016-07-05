class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  

  private

  def authenticate_user!
      unless current_user
        if request.xhr?
          render json: {msg: "Вы не авторизованы"}, status: 403            
        else
          # Сказать UserMailer отослать приветственное письмо после сохранения
          # UserMailer.welcome_email(@user).deliver_now

          # format.html { redirect_to(@user, notice: 'User was successfully created.') }
          # format.json { render json: @user, status: :created, location: @user }

          redirect_to root_path
        end
      end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

end
