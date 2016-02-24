class PlaylistSerializer < ActiveModel::Serializer
  attributes :id, :name, :design_id, :version
  has_many :videos
end
