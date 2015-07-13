class TimelineController < ApplicationController
  def index
    @medias = get_picture_list
    @photos = picture_search
  end
end
