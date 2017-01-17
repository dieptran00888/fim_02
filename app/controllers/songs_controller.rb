class SongsController < ApplicationController
  load_resource only: :show
  before_action :song_support, only: :show
  load_resource :song
  

  def show
    @commentable = @song
    @comment = current_user.comments.new
    @mark = Mark.find_or_create_by user_id: current_user.id, song_id: params[:id]
  end

  private
  def song_support
    @support = Supports::SongSupport.new @song
  end
end
