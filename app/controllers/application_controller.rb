class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  around_action :switch_locale

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  def default_url_options
    { locale: I18n.locale }
  end
  
  def user_index
    if user_signed_in? && current_user.admin?
      @users = User.all.order(id: :asc)
    else
      redirect_to root_path
    end
  end

  def set_user_role
    if !user_signed_in? || !current_user.admin?
      redirect_to root_path
    end
    @user = User.find(params[:user])
    if params[:role].present? && User.roles.include?(params[:role].to_sym)
      @user.role = params[:role].to_sym
      @user.save!
    end
    redirect_to user_index_path, notice: "#{@user.name}עודכן בהצלחה."
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
