class Design < ActiveRecord::Base
	has_many :photos
	has_many :playlists
	accepts_nested_attributes_for :photos , :allow_destroy => true
end
