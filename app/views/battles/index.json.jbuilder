json.array!(@battles) do |battle|
  json.extract! battle, :id, :applicant, :authorizer, :winner, :getup, :created_at, :updated_at
end
