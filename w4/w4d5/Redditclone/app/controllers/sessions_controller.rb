class SessionsController < ApplicationController

  def new
    if current_user
      redirect_to user_url(current_user)
    else
      render :new
    end
  end

  def create
    @user = User.find_by_credentials(session_params[:username], session_params[:password])
    if @user
      login(@user)
      flash[:messages] = ["Welcome!"]
      redirect_to user_url(@user)
    else
      render :new
      flash.now[:messages] = ["Invalid loggin"]
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end

  private

  def session_params
    params.require(:user).permit(:username, :password)
  end

end
