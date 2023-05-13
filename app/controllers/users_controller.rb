class UsersController < ApplicationController
  before_action :set_user

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @transactions = @user.transactions
    @categories = @user.categories
  end

  def new
    @user = User.new
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
