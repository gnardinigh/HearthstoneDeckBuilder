class ApplicationController < ActionController::Base
  # skip_before_action :actor_authorized, :production_company_authorized, except: :destroy
  helper_method :current_user
  helper_method :user_logged_in


  def current_user
    @user = User.find_by({ id: session[:user_id] })
  end



  def user_logged_in
    !!current_user()
  end



  def authorized
    redirect_to login_path unless user_logged_in
  end

end
