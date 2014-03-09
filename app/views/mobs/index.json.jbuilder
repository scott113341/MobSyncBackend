json.array!(@mobs) do |mob|
  json.extract! mob, :id, :user_ids
  json.url mob_url(mob, format: :json)
end
