class User < ApplicationRecord
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
