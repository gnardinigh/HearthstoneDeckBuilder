class UsersController < ApplicationController

  before_action :find_user, only: [:show]

  def show
    render :show
  end

  def profile
    render :show
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      flash[:notice] = "Signup successful! Welcome, #{@user.username}"
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
    render :edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Successfully updated profile"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    current_user.destroy
    flash[:notice] = "Deleted account for #{@user.username}"
    redirect_to new_user_path
  end

  private
  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
