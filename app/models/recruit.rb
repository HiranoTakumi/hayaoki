class Recruit < ApplicationRecord
  belongs_to :applicant, foreign_key: "applicant_id", class_name: "User"

  class << self


    def set_time(time)
      getup = Time.local(time[:year], time[:month], time[:day], time[:hour], time[:min])
    end

    def search_time(query)
      if query.present?
        rel = []
        table.each do |record|
          if record.getup.hour == query[:hour] && record.getup.day == query[:day]
            rel.push(record)
          end
        end
      end
      rel
    end

    def fetch(query)
      if query.present?
        id = get_id(query)
        table = where(authorizer_id: id)
      end
    end
  end
end
