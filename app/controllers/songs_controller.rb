class SongsController < ApplicationController
  
  def index
    if params[:artist_id]
      @songs = Song.find(params[:artist_id])
    else
      @songs = Song.all
    end
  end
    
  def new
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new
  end
  
  def create
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.create(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end
  
  def show
    if params[:artist_id]
      @song = Song.find(params[:artist_id])
      @artist = Artist.find(params[:artist_id])
    else
      @song = Song.find_by(params[:id])
    end  
  end
  
  def edit
    @song = Song.find(params[:id])
  end
  
  def update
    @song = Song.find(params[:id])
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end
  
  def destroy
    @artist = Artist.find(params[:artist_id])
    @song = Song.find(params[:id])
    @song.delete
    redirect_to artist_path(@artist)
  end
  
  private
  
  def song_params
    params.require(:song).permit(:title)
  end
end