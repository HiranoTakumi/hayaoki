json.array!(@recruits) do |recruit|
  json.extract! recruit, :id, :applicant, :authorizer, :getup, :created_at, :updated_at
end
