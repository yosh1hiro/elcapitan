class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include TimelineHelper

  def authenticate_user
    redirect_to login_url, alert: "ログインしてください" unless loged_in?
  end

  def admin_user
    redirect_to root_url, alert: 'アクセス権限がありません' unless administrator?
  end

  private
  def administrator?
    current_user && current_user.name.start_with?('admin.')
  end
  helper_method :administrator?
end
