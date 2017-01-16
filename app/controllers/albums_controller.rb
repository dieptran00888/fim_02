class AlbumsController < ApplicationController
  load_resource only: :show

  def show
  load_and_authorize_resource only: [:new, :create]
  before_action :set_attributes, only: :create

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

  private
  def album_params
    params.require(:album).permit :name, :album_type, :user_id
  end

  def set_attributes
    @album.album_type = "favorite"
    @album.user = current_user
  end
end
