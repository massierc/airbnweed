class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.sign_in_count < 2
      edit_user_path(resource_or_scope)
    else
      root_path
    end
  end
end
