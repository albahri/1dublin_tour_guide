json.array!(@tours) do |tour|
  json.extract! tour, :id, :name, :place, :date, :time, :cost, :description
  json.url tour_url(tour, format: :json)
end
