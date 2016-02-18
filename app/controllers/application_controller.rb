class ApplicationController < ActionController::Base
  before_action :store_location
  before_action :authenticate_user!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    return unless request.get?
    if (request.path != "/users/sign_in" &&
        request.path != "/users/sign_up" &&
        request.path != "/users/password/new" &&
        request.path != "/users/password/edit" &&
        request.path != "/users/confirmation" &&
        request.path != "/users/sign_out" &&
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath
    end
  end

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.sign_in_count < 2
      edit_user_path(resource_or_scope)
    else
      session[:previous_url] || root_path
    end
  end

  def after_update_path_for(resource_or_scope)
    session[:previous_url] || root_path
  end
  def after_sign_out_path_for(resource_or_scope)
    session[:previous_url] || root_path
  end

end
