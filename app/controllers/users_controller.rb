class UsersController < ApplicationController
  def index
    @users = User.order("score DESC")
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new(win: 0, lose: 0, draw: 0, score: 0)
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      render text: "Succeed!"
    else
      render text: "Error!"
    end
  end

  def update
    @user = User.find(params[:id])
    @user.assign_attributes(name: params[:name])
    if @user.save
      render text: "Succeed!"
    else
      render text: "Error!"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  def search
    @users = User.search(params[:q])
  end
end
