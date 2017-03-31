1.upto(5) do |idx_app|
  1.upto(5) do |idx_aut|
    if idx_app != idx_aut
      Battle.create(
        applicant: idx_app,
        authorizer: idx_aut,
        condition: true,
        flag: true,
        result: idx_app,
        getup: '7:00'
      )
    end
  end
end
