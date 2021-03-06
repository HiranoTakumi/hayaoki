class RecruitsController < ApplicationController
  def index # 対戦相手を指定していない申し込み一覧を取得
    @recruits = Recruit.includes(:applicant).where(authorizer_id: nil)
  end

  def show # 自分の対戦申し込みが成立したかどうかを確認
    @recruits = Recruit.includes(:applicant).where(id: params[:id])
    if @recruits.length == 1 # still recruiting...
      render text: "still recruiting..."
    else # recruit already accepted
      @battles = Battle.where(applicant_id: params[:applicant_id], result:  nil)
      @battle = @battles[0]
      render 'accept'
    end
  end

  def new
  end

  def create # 申し込む
    app_id = Battle.get_id(params[:applicant])
    aut_id = Battle.get_id(params[:authorizer])
    @recruit = Recruit.new(applicant_id: app_id, authorizer_id: aut_id, getup: Recruit.set_time(params[:getup]))
    unless @recruit.save
      render text: "Save failed!"
    end
    @authorizer = params[:authorizer]
  end

  def edit
  end

  def update # 申し込み内容を変更する
    aut_id = Battle.get_id(params[:authorizer])
    @recruit = Recruit.find(params[:id])
    @recruit.assign_attributes(authorizer_id: aut_id, getup: Recruit.set_time(params[:getup]))
    if @recruit.save
      @authorizer = params[:authorizer]
      render 'create'
    else
      render text: "Update failed!"
    end
  end

  def destroy # 申し込みをキャンセルする
    @recruit = Recruit.find(params[:id])
    if @recruit.destroy
      render text: "Recruit deleted!"
    else
      render text: "Delete failed!"
    end
  end

  def accept # 申し込みを受け入れる
    @recruit = Recruit.find(params[:id])
    aut_id = Battle.get_id(params[:authorizer])
    @battle = Battle.new(applicant_id: @recruit.applicant_id, authorizer_id: aut_id, result: nil, getup: @recruit.getup)
    if @battle.save
      @recruit.destroy
    else
      render text: "Acception failed!"
    end
  end

  def search # 指定した時刻で募集中の対戦レコードを探す
    time = Recruit.set_time(params[:getup])
    @recruits = Recruit.includes(:applicant).where(authorizer_id: nil, getup: time...(time+3600)).order("getup")
    render 'index'
  end

  def fetch # 自分に対戦申し込みが来ていないかチェックする
    user_id = Battle.get_id(params[:query])
    @authorizer = params[:query]
    @recruits = Recruit.includes(:applicant).where("authorizer_id = ?", user_id).order("id DESC")
    render 'index'
  end

  def check
    if @recruit = Recruit.find_by(applicant_id: params[:id])
      render json: true
    else
      render json: false
    end
  end
end
