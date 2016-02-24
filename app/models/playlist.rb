class Playlist < ActiveRecord::Base
	has_many :videos
	belongs_to :design
	has_one :group

end
