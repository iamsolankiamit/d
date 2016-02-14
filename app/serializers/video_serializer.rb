class VideoSerializer < ActiveModel::Serializer
  attributes :id, :movie_url, :movie_file_name
end
