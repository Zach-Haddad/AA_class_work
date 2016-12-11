class PostsController < ApplicationController
  before_action :is_author?, only: [:edit, :update]

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:messages] = ["invalid post"]
      render :new
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
    render :edit
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:messages] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to subs_url(@post.subs.first)
  end

  def show
    @post = Post.find_by(id: params[:id])
    render :show
  end

  def is_author?
    current_user.id == Post.find_by(id: params[:id]).author_id
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, :author_id, sub_ids: [])
  end

end
