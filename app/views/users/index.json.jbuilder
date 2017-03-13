json.array!(@users) do |user|
  json.extract! user, :id, :name, :win, :lose, :draw, :score, :created_at, :updated_at
#  json.url user_url(user, format: :json)
end
