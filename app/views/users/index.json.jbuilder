json.array!(@users) do |user|
  json.extract! user, :id, :name, :win, :lose, :draw, :score
end
