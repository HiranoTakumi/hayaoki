class UsersController < ApplicationController
  def index
    @users = User.order("score DESC")
  end

  def show
    @user = User.find(params[:id])
  end

  def new
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
    @user.assign_attributes(params[:user])
    if @user.save
      render text: "Succeed!"
    else
      render text: "Error!"
    end
  end

  def destroy
  end

  def search
    @users = User.search(params[:q])
  end

end
