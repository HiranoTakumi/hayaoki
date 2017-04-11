json.array!(@recruits) do |recruit|
  json.set! :id, recruit.id
  json.set! :applicant, recruit.applicant.name
  json.set! :getup, recruit.getup
  json.set! :created_at, recruit.created_at
  json.set! :updated_at, recruit.updated_at
end
