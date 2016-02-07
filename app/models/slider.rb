class Slider < ActiveRecord::Base
	belongs_to :display
	has_attached_file :image
end
