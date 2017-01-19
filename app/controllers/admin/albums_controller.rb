class Admin::AlbumsController < ApplicationController
  load_and_authorize_resource
  before_action :album_support, only: [:new, :edit]

  def index
  end

  def new
    @album.songs.build
  end

  def create
    if @album.save
      flash[:success] = t "flash.create_success"
      redirect_to admin_albums_path
    else
      album_support
      flash[:danger] = t "flash.create_failed"
      redirect_to admin_album_path
    end
  end

  def edit
  end

  def update
    if @album.update_attributes album_params
      flash[:success] = t "flash.update_success"
      redirect_to admin_albums_path
    else
      render :edit
    end
  end

  def destroy
    @album.destroy
    flash[:success] = t "flash.destroy_success"
    redirect_to :back
  end

  private
  def album_params
    params.require(:album).permit :name, :avatar,
      songs_attributes: [:id, :name, :url_content, :singer_id, :composer_id,
        :category_id, :_destroy]
  end

  def album_support
    @support = Supports::AlbumSupport.new @album
  end
end
