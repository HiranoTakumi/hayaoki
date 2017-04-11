class User < ApplicationRecord
  has_many :applicant_battles, class_name: "Battle", dependent: :destroy, foreign_key: "applicant_id"
  has_many :authorizer_battles, class_name: "Battle", dependent: :destroy, foreign_key: "authorizer_id"
  has_many :applicant_recruits, class_name: "Recruit", dependent: :destroy, foreign_key: "applicant_id"
  class << self
    def search(query)
      rel = order("score DESC")
      if query.present?
        rel = rel.where("name LIKE ?", "%#{query}%")
      end
      rel
    end

  end
end
