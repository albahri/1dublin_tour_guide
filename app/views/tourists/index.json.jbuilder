json.array!(@tourists) do |tourist|
  json.extract! tourist, :id, :firstname, :lastname, :email, :phone
  json.url tourist_url(tourist, format: :json)
end
