class SongsController < ApplicationController
  load_resource only: :show
  before_action :song_support, only: :show
  load_resource :song
  before_action :load_albums, only: :show

  def index
    @search = Song.search params[:q]
    @songs = @search.result
  end

  def show
    @commentable = @song
    @comment = current_user.comments.new
    @mark = Mark.find_or_create_by user_id: current_user.id, song_id: params[:id]
    impressionist @song
    @song.update_attributes(views: @song.impressionist_count,
      artist_id: @song.singer_id)
  end

  private
  def song_support
    @support = Supports::SongSupport.new @song
  end

  def load_albums
    @albums = Album.all
  end

end
