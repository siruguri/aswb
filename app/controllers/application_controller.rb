class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action do
    # Quite a few things to do before the app starts...
    I18n.locale = set_locale
    insert_default_param_filter
    create_navbar_data
  end

  rescue_from ActionController::RoutingError do |exception|
    error_message = I18n.t(:message_404)
    go_back_or_root(error_message)
  end
  rescue_from CanCan::AccessDenied do |exception|
    error_message = I18n.t(:access_denied_message)
    #    go_back_or_root(error_message)
    redirect_to '/users/sign_in', notice: 'Please sign in to access the website.'
  end

  private
  def set_locale
    # 1. Let's make our app use the locale
    
    params[:locale] || I18n.default_locale
  end

  def insert_default_param_filter
    # 2. This helps Rails4 strong parameter setting
    resource = controller_name.singularize.to_sym
    method = "#{resource}_strong_params"

    params[resource] &&= send(method, params[resource]) if respond_to?(method, true)
  end

  def create_navbar_data
    @navbar_entries = NavbarEntry.all.map do |entry|
      {title: entry.title, url: entry.url }
    end

    if current_user && current_user.admin? # Admin can see rails admin
      @navbar_entries << {title: 'Administer', url: '/rails_admin'}
    end
  end

  def go_back_or_root(message)
    if request.env.key? "HTTP_REFERER"
      redirect_to :back, :alert => message
    else
      redirect_to "/", :alert => message

#      redirect_to root_url, :alert => message
    end
  end 

  # Use URL options to set locale. I prefer it that way.
  def default_url_options(options={})
    { locale: I18n.locale }
  end
end
