class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  protected
  def after_sign_in_path_for(resource)
    disks_path
  end
end
