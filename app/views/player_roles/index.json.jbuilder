json.array!(@player_roles) do |player_role|
  json.extract! player_role, :id
  json.url player_role_url(player_role, format: :json)
end
