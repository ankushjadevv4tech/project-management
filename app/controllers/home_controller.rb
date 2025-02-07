class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: :landing
  def dashboard
  end

  def landing
    redirect_to authenticated_root_path if user_signed_in?
  end
end
