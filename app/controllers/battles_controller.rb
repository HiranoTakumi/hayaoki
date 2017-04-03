class BattlesController < ApplicationController
  def index
  end

  def show
    if user = User.find_by(name: params[:query])
      @battles = Battle.search(user.id)
    else
      render text: "The user \"#{params[:query]}\" was not found."
    end
  end

  def new
    @battle = Battle.new(condition: false, flag: false)
  end

  def edit
  end

  def create
    @battle = Battle.new(applicant: params[:applicant], getup: params[:getup])
    if @battle.save
      render text: "Succeed!"
    else
      render text: "Error!"
    end
  end

  def update
  end

  def destroy
    @battle = Battle.find(params[:id])
    if @battle.condition
      render text: "Cannot delete!"
    else
      @battle.destroy
    end
  end

  def search
    @battles = Battle.search_time(params[:query])
  end
end
