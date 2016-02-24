class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :count, :playlist_id, :updated_at
end
