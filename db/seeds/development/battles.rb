1.upto(10) do |idx_app|
  1.upto(10) do |idx_aut|
    if idx_app != idx_aut
      Battle.create(
        applicant_id: idx_app,
        authorizer_id: idx_aut,
        result: (idx_app + idx_aut) % 2 - 1,
        getup: Time.now
      )
    end
  end
end
