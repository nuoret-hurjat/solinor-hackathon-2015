json.array!(@companies) do |company|
  json.extract! company, :id, :name, :logo, :description, :admin_edited
  json.url company_url(company, format: :json)
end
