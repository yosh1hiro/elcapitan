module TimelineHelper
  def get_picture_list
    Instagram.location_recent_media(237673921, count: 100)  # gets JSON by     location id which is elcapitan
  rescue => e
    logger.error(e.backtrace)
  end
end
