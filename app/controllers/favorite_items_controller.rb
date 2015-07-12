class FavoriteItemsController < ApplicationController
  def index
  end

  def create
    @favorite = FavoriteItem.find_or_create_by(item: params[:item], user_id: current_user.id) if current_user
    cookies.permanent[:item] = params[:item]
    if @favorite.save
      render layout: nil,  notice: "お気に入りに登録しました"
    else
      render layout: nil, alert: "この写真はお気に入りに登録できません"
    end
  end

  def destroy
    if current_user
      @favorite = current_user.favorite_items.find_by(params[:item])
    else
      @favorite = cookies[:item]
    end
    @favorite.destroy
    cookies.delete :item
  end
end
