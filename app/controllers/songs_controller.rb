class SongsController < ApplicationController
  load_resource only: :show
  before_action :song_support, only: :show

  def show
    @commentable = @song
    @comment = current_user.comments.new
  end

  private
  def song_support
    @support = Supports::SongSupport.new @song
  end
end
