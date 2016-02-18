class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  layout 'application', except: :home
  layout 'application_without_footer', only: :home

  def home
    @navbar_class_for_home = 'navbar-wagon-fixed'
    @button_navbar_for_home = 'navbar-wagon-button-home'
  end
end
