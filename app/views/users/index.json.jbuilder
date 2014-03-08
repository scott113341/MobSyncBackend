json.array!(@users) do |user|
  json.extract! user, :id, :name, :device_id
  json.url user_url(user, format: :json)
end
