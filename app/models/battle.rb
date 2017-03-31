class Battle < ApplicationRecord
  class << self
    def search(query)
      table = order("id")
      if query.present?
        rel = table.where("(applicant = ?) OR (authorizer = ?)", query, query)
      end
      rel
    end

    def search_time(query)
    end
  end
end
