class Design < ActiveRecord::Base
	has_many :photos
	has_many :playlists
end
