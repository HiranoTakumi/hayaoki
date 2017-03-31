1.upto(5) do |idx_app|
  1.upto(5) do |idx_aut|
    if idx_app != idx_aut
      Battle.create(
        applicant: idx_app * 10,
        authorizer: idx_aut * 10,
        condition: false,
        flag: true,
        result: idx_app * 10,
        getup: idx_app.to_s + ':' + (idx_aut * 10).to_s
      )
    end
  end
end
