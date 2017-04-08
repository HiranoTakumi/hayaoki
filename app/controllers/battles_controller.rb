class BattlesController < ApplicationController
  def index # 全対戦レコードを取得
    records = Battle.order("id DESC")
    @battles = []
    records.each do |record|
      @battles.push(Battle.id_to_name(record))
    end
  end

  def show # 指定したユーザーの対戦レコードを取得
    user_id = User.find_by(name: params[:query])
    @battles = Battle.search(user_id)
    render 'index'
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end



  def wake # 起床アクション
    @battle = Battle.find(params[:id])
    @user = User.find(params[:winner_id])
    if @battle.winner_id.present?
      if @battle.winner_id > 0
        @user.lose += 1
        @user.score -= 2
        @user.save
        render text: "You lose."
      else
        @user.draw += 1
        @user.score -= 1
        @user.save
        render text: "Draw game!"
      end
    else
      if Time.now.min - @battle.getup.min < 5
        @battle.assign_attributes(winner_id: params[:winner_id])
        @battle.save
        @user.win += 1
        @user.score += 2
        @user.save
        render text: "You win!"
      else
        @battle.winner_id = -1
        @battle.save
        @user.draw += 1
        @user.score -= 1
        @user.save
        render text: "Draw game!"
      end
    end
  end
end
