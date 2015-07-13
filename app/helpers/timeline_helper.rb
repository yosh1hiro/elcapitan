module TimelineHelper
  #  instagram
  def get_picture_list
    Instagram.location_recent_media(237673921, count: 100)  # gets JSON by     location id which is elcapitan
  rescue => e
    logger.error(e.backtrace)
  end

  #  flickr
  def picture_search
    FlickRaw.api_key       = ENV["FLICKR_API_KEY"]
    FlickRaw.shared_secret = ENV["FLICKR_SHARED_SECRET"]
    flickr.access_token    = ENV["FLICKR_ACCESS_TOKEN"]
    flickr.access_secret   = ENV["FLICKR_ACCESS_SECRET"] 
    flickr.test.login
    @photos = flickr.photos.search(text: "elcapitan", license:"1,2,3,4,5,6")
  end
end
