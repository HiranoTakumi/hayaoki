class Recruit < ApplicationRecord
  belongs_to :applicant, foreign_key: "applicant_id", class_name: "User"

  class << self


    def set_time(time)
      getup = Time.local(time[:year], time[:month], time[:day], time[:hour], time[:min])
    end


  end
end
