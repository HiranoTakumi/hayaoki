class UsersController < ApplicationController
  def index
    @users = User.order("score DESC")
  end

  def show
    if @user = User.find_by(name: params[:name])
    else
      render text: "The user \"#{params[:name]}\" was not found."
    end
  end

  def new
    @user = User.new(win: 0, lose: 0, draw: 0, score: 0)
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(win: 0, lose: 0, draw: 0, score: 0)
    @user.assign_attributes(name: params[:name], password: params[:password])
    unless @user.save
      render text: "Create failed!"
    end
  end

  def update
    @user = User.find(params[:id])
    @user.assign_attributes(name: params[:name])
    if @user.save
      render 'create'
    else
      render text: "Update failed!"
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      render text: "User deleted!"
    else
      render text: "Delete failed!"
    end
  end

  def search
    @users = User.search(params[:name])
  end
end
