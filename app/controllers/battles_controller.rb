class BattlesController < ApplicationController
  def index # 全対戦レコードを取得
    @battles = Battle.includes(:applicant, :authorizer).order("id DESC")
  end

  def show # 指定したユーザーの対戦レコードを取得
    user_id = Battle.get_id(params[:query])
    @battles = Battle.includes(:applicant, :authorizer).where("applicant_id = ? OR authorizer_id = ?", user_id, user_id).order("id DESC")
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
    if @battle.getup > Time.now
      render text: "You got up too earlier."
    else
      @user = User.find(params[:winner_id])
      if @battle.result.present?
        if @battle.result != 0
          @user = Battle.losegame(@user)
          @user.save
          render text: "You lose."
        else
          @user = Battle.drawgame(@user)
          @user.save
          render text: "Draw game!"
        end
      else
        if Time.now - @battle.getup < 300
          params[:winner_id] == @battle.applicant_id ? result = 1 : result = -1
          @battle.result = result
          @battle.save
          @user = Battle.wingame(@user)
          @user.save
          render text: "You win!"
        else
          @battle.result = 0
          @battle.save
          @user = Battle.drawgame(@user)
          @user.save
          render text: "Draw game!"
        end
      end
    end
  end
end
