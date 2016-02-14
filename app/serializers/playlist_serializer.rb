class PlaylistSerializer < ActiveModel::Serializer
  attributes :id, :name, :design_id
  has_many :videos
end
