class Video < ActiveRecord::Base
  after_save :updater
	belongs_to :playlist
	has_attached_file :movie,:styles => {
    :medium => { :geometry => "640x480", :format => 'mp4' },
    :high => { :geometry => "1280x720", :format => 'mp4' },
    :veryhigh => { :geometry => "1920x1080", :format => 'mp4' },
    :thumb => { :geometry => "100x100#", :format => 'jpg', :time => 10 }
  }, processors: [:transcoder]

	validates_attachment_content_type :movie, :content_type => ["video/mp4", "video/webm", "video/flv", "video/mpeg"]

  def movie_url
  	self.movie.url(:veryhigh)
  end

  def updater
    playlist = Playlist.find(self.playlist_id)
    playlist.version += 1
    playlist.save
  end
end
