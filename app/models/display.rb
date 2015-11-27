class Display < ActiveRecord::Base
	has_attached_file :left_photo
	has_attached_file :right_photo
	has_attached_file :bottom_photo
	has_attached_file :signage_video,:styles => {
    :medium => { :geometry => "640x480", :format => 'webm' },
    :thumb => { :geometry => "100x100#", :format => 'jpg', :time => 10 }
  }, :processors => [:transcoder]
	validates_attachment_content_type :left_photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	validates_attachment_content_type :right_photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	validates_attachment_content_type :bottom_photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	validates_attachment_content_type :signage_video, :content_type => ["video/mp4", "video/webm", "video/flv", "video/mpeg"]
end
