class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  def new

  end
  def create
    @user = User.find_by({ username: params[:username] })
    if !!@user && @user.authenticate(params[:password])
      flash[:notice] = "Successfully logged in #{@user.username}!"
      redirect_to @user
    else
      flash[:notice] = 'Incorrect username or password.'
      redirect_to profile_path
    end
  end

  def edit
    current_user
    render :edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = 'Updated user information.'

    else
      render :edit
    end
  end

  private

end
