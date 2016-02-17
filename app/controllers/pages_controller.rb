class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @navbar_class_for_home = 'navbar-wagon-fixed'
    @button_navbar_for_home = 'navbar-wagon-button-home'
  end
end
