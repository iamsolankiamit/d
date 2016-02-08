class Api::V1::VideoSerializer < ActiveModel::Serializer
  attributes :id, :movie_content_type, :movie_file_name, :movie_file_size, :playlist_id
end
