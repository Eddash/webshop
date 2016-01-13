json.array!(@whiskies) do |whisky|
  json.extract! whisky, :id, :name, :old, :price, :liter, :land, :volume, :description, :pic_url
  json.url whisky_url(whisky, format: :json)
end
