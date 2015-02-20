json.array!(@technologies) do |technology|
  json.extract! technology, :id, :name, :url, :logo, :front, :back, :description
  json.url technology_url(technology, format: :json)
end
