class RecruitsController < ApplicationController
  def index # 申し込み一覧を取得
    records = Recruit.order("id DESC")
    @recruits = []
    records.each do |record|
      @recruits.push(Recruit.id_to_name(record))
    end
  end

  def show
  end

  def new
  end

  def create # 申し込む
    app_id = Recruit.get_id(params[:applicant])
    aut_id = Recruit.get_id(params[:authorizer])
    @recruit = Recruit.new(applicant_id: app_id, authorizer_id: aut_id, getup: Recruit.set_time(params[:getup]))
    unless @recruit.save
      render text: "Save failed!"
    end
    @record = Recruit.id_to_name(@recruit)
  end

  def edit
  end

  def update # 申し込み内容を変更する
    aut_id = Recruit.get_id(params[:authorizer])
    @recruit = Recruit.find(params[:id])
    @recruit.assign_attributes(authorizer_id: aut_id, getup: Time.zone.local(params[:getup]))
    if @recruit.save
      @record = Recruit.id_to_name(@recruit)
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
    aut_id = Recruit.get_id(params[:authorizer])
    @battle = Battle.new(applicant_id: @recruit.applicant_id, authorizer_id: aut_id, winner_id: nil, getup: @recruit.getup)
    if @battle.save
      @recruit.destroy
      @record = Battle.id_to_name(@battle)
    else
      render text: "Acception failed!"
    end
  end

  def search # 指定した時刻で募集中の対戦レコードを探す
    records = Recruit.search_time(params[:getup])
    @recruits = []
    records.each do |record|
      @recruits.push(Recruit.id_to_name(record))
    end
    render 'index'
  end

  def fetch # 自分に対戦申し込みが来ていないかチェックする
    records = Recruit.fetch(params[:query])
    @recruits = []
    records.each do |record|
      @recruits.push(Recruit.id_to_name(record))
    end
    render 'index'
  end
end
