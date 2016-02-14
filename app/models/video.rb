class Video < ActiveRecord::Base
	belongs_to :playlist
	has_attached_file :movie,:styles => {
    :medium => { :geometry => "640x480", :format => 'mp4' },
    :high => { :geometry => "1280x720", :format => 'mp4' },
    :high => { :geometry => "1920x1080", :format => 'mp4' },
    :thumb => { :geometry => "100x100#", :format => 'jpg', :time => 200 }
  }

	validates_attachment_content_type :movie, :content_type => ["video/mp4", "video/webm", "video/flv", "video/mpeg"]

  def movie_url
  	self.movie.url(:original)
  end
end
