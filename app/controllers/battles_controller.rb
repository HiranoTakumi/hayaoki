class BattlesController < ApplicationController
  def index
    @battles = Battle.search(params[:q])
  end

  def show
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

  def search
    @battles = Battle.search_time(params[:q])
  end
end
