class AlbumsController < ApplicationController
  load_resource only: :show
  load_and_authorize_resource only: [:new, :create]

  before_action :set_attributes, only: :create
  before_action :album_support, only: :show
  before_action :load_albums, only: :show

  def index
    @search = Album.search params[:q]
    @albums = @search.result
  end

  def new
  end

  def create
    if @album.save
      flash[:success] = t "flash.create_success"
      redirect_to @album.user
    else
      album_support
      redirect_to :back
    end
  end

  def show
    @commentable = @album
    @comment = current_user.comments.new
    impressionist @album
  end
  
  private
  def album_params
    params.require(:album).permit :name, :album_type, :user_id
  end

  def album_support
    @support = Supports::AlbumSupport.new @album
  end

  def load_albums
    @albums = Album.all
  end
end
