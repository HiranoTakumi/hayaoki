class Battle < ApplicationRecord
  class << self
    def search(query)
      rel = order("id")
      if query.present?
        rel = rel.where("applicant ? OR authorizer ?", "%#{query}%", "%#{query}%")
      end
      rel
    end
  end
end
