1.upto(10) do |idx_app|
  1.upto(10) do |idx_aut|
    if idx_app != idx_aut
      Battle.create(
        applicant: idx_app,
        authorizer: idx_aut,
        condition: true,
        flag: true,
        result: idx_app * 10,
        getup: idx_app.to_s + ':00'
      )
    end
  end
end
