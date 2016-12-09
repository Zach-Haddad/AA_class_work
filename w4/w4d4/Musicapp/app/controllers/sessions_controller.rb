class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      session_params[:email],
      session_params[:password],
    )

    if user
      login(user)
      flash[:messages] = (["Welcome back!"])
      redirect_to user_url(user)
    else
      flash.now[:messages] = ["Invalid login credentials"]
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
