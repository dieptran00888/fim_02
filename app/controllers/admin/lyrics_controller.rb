class Admin::LyricsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def update
    if @lyric.approved!
      redirect_to admin_lyrics_path
    end
  end

  def destroy
    @lyric.destroy
    flash[:success] = t"flash.destroy_success"
    redirect_to admin_lyrics_path
  end

  private
  def lyric_param
    params.require(:lyric).permit :content, :user_id, :song_id, :status
  end

end
