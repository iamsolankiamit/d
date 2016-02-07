json.array!(@designs) do |design|
  json.extract! design, :id, :slider, :name
  json.url design_url(design, format: :json)
end
