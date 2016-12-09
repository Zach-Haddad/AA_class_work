class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
      if @user.save
        login(@user)
        redirect_to user_url(@user)
      else
        flash.now[:errors] = @user.errors.full_messages
        render :new
      end
  end

  def new
    @user = User.new
    render :new
  end

  def show
    if current_user.id == params[:id].to_i
      @user = User.find(params[:id])
      render :show
    else
      redirect_to new_user_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
