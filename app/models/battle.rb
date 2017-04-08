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

    def id_to_name(record)
      if record.winner_id
        if record.winner_id < 0
          winner = "even"
        else
          winner = User.find(record.winner_id).name
        end
      else
        winner = record.winner_id
      end
      rel = { id: record.id,
              applicant: record.applicant.name,
              authorizer: record.authorizer.name,
              winner: winner,
              getup: record.getup,
              created_at: record.created_at,
              updated_at: record.updated_at
            }
    end

    def get_id(name)
      if user = User.find_by(name: name)
        user.id
      else
        nil
      end
    end
  end
end
