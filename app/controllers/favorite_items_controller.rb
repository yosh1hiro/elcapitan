class FavoriteItemsController < ApplicationController
  def index
  end

  def create
    @favorite = FavoriteItem.find_or_create_by(item: params[:item], user_id: current_user.id) if current_user
    cookies.permanent[:item] = params[:item]
    if @favorite.save
      redirect_to root_url,  notice: "お気に入りに登録しました"
    else
      render layout: nil, alert: "この写真はお気に入りに登録できません"
    end
  end

  def destroy
    @favorite = FavoriteItem.find(params[:id])
    @favorite.destroy
    cookies.delete :item
    redirect_to root_url
  end
end
