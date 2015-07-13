module FavoriteItemsHelper
  def favorited?(item)
    id = item.id
    if current_user
      current_user.favorite_items.where(item: id).exists?
    else
      id == cookies[:item]
    end
  end
end
