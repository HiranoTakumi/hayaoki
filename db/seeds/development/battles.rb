1.upto(10) do |idx_app|
 1.upto(10) do |idx_aut|
    (idx_app + idx_aut) % 2 == 0 ? w = idx_aut : w = idx_app
    if idx_app != idx_aut
      Battle.create(
        applicant_id: idx_app,
        authorizer_id: idx_aut,
        winner_id: w,
        getup: Time.now 
      )
    end
  end
end
