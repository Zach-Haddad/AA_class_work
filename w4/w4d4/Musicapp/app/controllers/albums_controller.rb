class AlbumsController < ApplicationController
  def show
    @album = Album.find(params[:id])
    @band = @album.band
    @tracks = @album.tracks
    render :show
  end

  def new
    @album = Album.new
    @album[:band_id] = params[:band_id]
    render :new
  end

  def create
    @band = Band.find(params[:band_id])
    @album = Album.new(album_params)
    if @album.save
      redirect_to band_url(@album.band)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to band_url(@band)
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(band_params)
      redirect_to band_album_url(@band)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  private

  def album_params
    params.require(:album).permit(:name, :band_id, :year, :recording)
  end
end
