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
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(name: params[:name])
    unless @user.save
      render text: "Create failed!"
    end
  end

  def update
    @user = User.find(params[:id])
    if params[:name].present?
      @user.assign_attributes(name: params[:name])
    end
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
