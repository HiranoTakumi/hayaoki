class BattlesController < ApplicationController
  def index
    @battles = Battle.order("id")
  end

  def show
    @battles = Battle.search(params[:q])
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

  end
end
