class SessionController < ApplicationController
  def create
      begin
        @user = User.from_omniauth(auth_hash)
        session[:user_id] = @user.id
        flash[:success] = "Welcome, #{@user.battletag}!"
      rescue
        flash[:warning] = "There was an error while trying to authenticate you..."
      end
      redirect_to root_path
  end

  def destroy
    if current_user
      session.delete(:user_id)
      session.delete[:token]
      flash[:success] = 'Come back later!'
    end
    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
