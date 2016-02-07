class Group < ActiveRecord::Base
	has_many :pis
	belongs_to :playlist
end
