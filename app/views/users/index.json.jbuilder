json.array!(@users) do |user|
  json.extract! user, :id, :name, :steamid, :logo, :mmr, :email
  json.url user_url(user, format: :json)
end
