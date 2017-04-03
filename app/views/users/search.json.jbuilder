json.array!(@users) do |user|
  json.extract! user, :name, :score
end
