class Battle < ApplicationRecord
  class << self
    def search(query)
      table = order("id DESC")
      if query.present?
        rel = table.where("(applicant = ?) OR (authorizer = ?)", query, query)
      end
      rel
    end

    def search_time(query)
      table = order("id")
      table = table.where(condition: false)
      if query.present?
        rel = table.where(getup: query)
      end
      rel
    end
  end
end
