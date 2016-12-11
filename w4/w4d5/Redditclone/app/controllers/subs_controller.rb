class SubsController < ApplicationController
  before_action :is_moderator?, only: [:edit, :update]

  def is_moderator?
    current_user.id == Sub.find_by(id: params[:id]).moderator_id
  end

  def new
    @sub = Sub.new
    @sub.moderator_id = current_user.id
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:message] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    @sub = Sub.find_by(id: params[:id])
    render :edit
  end

  def update
    @sub = Sub.find_by(id: params[:id])
    if @sub.update_attributes(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:message] = @sub.errors.full_messages
      render :edit
    end
  end

  def show
    @sub = Sub.find_by(id: params[:id])
    render :show
  end

  def index
    render :index
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :moderator_id, :description)
  end

end
