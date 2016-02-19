class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  layout :resolve_layout

  def home
    @navbar_class_for_home = 'navbar-wagon-fixed'
    @button_navbar_for_home = 'navbar-wagon-button-home'
  end

  def bye
  end

  private

  def resolve_layout
   case action_name
    when "home"
      "application_without_footer"
    when "bye"
      "bye"
    else
      "application"
    end
  end
end
