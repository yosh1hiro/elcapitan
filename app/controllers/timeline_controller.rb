class TimelineController < ApplicationController
  def index
    @medias = get_picture_list
  end
end
