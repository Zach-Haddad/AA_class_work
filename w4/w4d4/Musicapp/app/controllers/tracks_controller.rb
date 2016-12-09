class TracksController < ApplicationController
  def show
    @track = Track.find(params[:id])
    render :show
  end

  def new
    @track = Track.new
    render :new
  end

  def create
    @track = Album.new(album_params)
    if @track.save
      redirect_to band_album_url(@band, @album)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy
    redirect_to band_album_url(@band, @album)
  end

  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def update
    @track = Track.find(params[:id])
    if @track.update_attributes(band_params)
      redirect_to band_album_track_url(@band, @album, @track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :edit
    end
  end

  private

  def track_params
    params.require[:track].permit(:name, :ord, :album_id)
  end
end
