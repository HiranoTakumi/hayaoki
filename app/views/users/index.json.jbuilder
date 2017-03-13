json.array!(@users) do |user|
  json.extract! user, :id, :name, :win, :lose, :draw, :score
#  json.url user_url(user, format: :json)
end
