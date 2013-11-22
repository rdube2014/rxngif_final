class UsersController < ApplicationController
  before_action :set_user, :only => [:show, :edit, :update, :destroy]
  before_action :authorize_user, :only => [:edit, :update, :destroy]

  def set_user
    @user = User.find(params[:id])
  end

  def authorize_user
    unless @user == current_user
      redirect_to root_url, :alert => "You are not authorized for that."
    end
  end

  def index
    @users = User.all
  end

  def show
  end

  def new
  end

  def create
    @user = User.new
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]

    if @user.save
      redirect_to users_url, notice: "User created successfully."
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]

    if @user.save
      redirect_to users_url, notice: "User updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy

    redirect_to users_url, notice: "User deleted."
  end
end
