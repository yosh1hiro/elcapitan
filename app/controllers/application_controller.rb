class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include TimelineHelper
  include FavoriteItemsHelper

  def authenticate_user
    redirect_to login_url, alert: "ログインしてください" unless loged_in?
  end

  def admin_user
    redirect_to root_url, alert: 'アクセス権限がありません' unless administrator?
  end

  def favorited?(item)
    id = item.id
    if current_user
      current_user.favorite_items.where(item: id).exists?
    else
      id == cookies[:item]
    end
  end
  helper_method :favorited?

  private
  def administrator?
    current_user && current_user.name.start_with?('admin.')
  end
  helper_method :administrator?

  def favorite_item_id(media_id)
    item = current_user.favorite_items.find_by(item: media_id)
    @favorite_id = item.id
  end
  helper_method :favorite_item_id
end
