json.array!(@battles) do |battle|
  json.extract! battle, :id, :applicant, :authorizer, :condition, :flag, :result, :getup
end
