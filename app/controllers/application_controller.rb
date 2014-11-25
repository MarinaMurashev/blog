class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_filter :ensure_domain

  private

  def ensure_domain
    redirect_to subdomain: 'www' unless Rails.env == "development"
  end
end
