class Recruit < ApplicationRecord
#  belongs_to :battle

  class << self

    def id_to_name(record)
      if record.authorizer_id
        authorizer = User.find(record.authorizer_id).name
      end
      rel = { id: record.id,
              applicant: User.find(record.applicant_id).name,
              authorizer: authorizer,
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

    def set_time(time)
      getup = Time.local(time[:year], time[:month], time[:day], time[:hour], time[:min])
    end

    def search_time(query)
      if query.present?
        table = order("id DESC")
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
