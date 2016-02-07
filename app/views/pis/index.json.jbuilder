json.array!(@pis) do |pi|
  json.extract! pi, :id, :name, :uid, :group_id
  json.url pi_url(pi, format: :json)
end
