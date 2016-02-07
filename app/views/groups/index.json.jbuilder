json.array!(@groups) do |group|
  json.extract! group, :id, :name, :playlist_id
  json.url group_url(group, format: :json)
end
