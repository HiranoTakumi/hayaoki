1.upto(9) do |idx_app|
  Recruit.create(
    applicant_id: idx_app,
    authorizer_id: nil,
    getup: Time.local(2017, 5, 5, 20, idx_app * 6)
  )
end
Recruit.create(
  applicant_id: 10,
  authorizer_id: nil,
  getup: Time.local(2017, 5, 5, 21, 0)
)
