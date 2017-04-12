class Battle < ApplicationRecord
  belongs_to :applicant, foreign_key: "applicant_id", class_name: "User"
  belongs_to :authorizer, foreign_key: "authorizer_id", class_name: "User"
#  has_one :recruit


  class << self


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
