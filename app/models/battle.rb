class Battle < ApplicationRecord
  belongs_to :applicant, foreign_key: "applicant_id", class_name: "User"
  belongs_to :authorizer, foreign_key: "authorizer_id", class_name: "User"
#  has_one :recruit


  class << self
    def search(query)
      table = where("(applicant_id = ?) OR (authorizer_id = ?)" , query, query).reorder("id DESC")
      rel = []
      if query.present?
        table.each do |record|
          rel.push(id_to_name(record))
        end
      end
      rel
    end


    def get_id(name)
      if user = User.find_by(name: name)
        user.id
      else
        nil
      end
    end

    def wingame(user)
      user.win += 1
      user.score += 2
      user
    end

    def losegame(user)
      user.lose += 1
      user.score -= 2
      user
    end

    def drawgame(user)
      user.draw += 1
      user.score -= 1
      user
    end
  end
end
