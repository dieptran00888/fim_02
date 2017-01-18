class LyricsController < ApplicationController
  load_resource :song

  def new
    @lyric = @song.lyrics.build
  end

  def create
    @lyric = @song.lyrics.new lyric_params
    if @lyric.save
      flash[:success] = t "flash.create_success";
      redirect_to @song
    else
      render :new
    end
  end
  
  private
  def lyric_params
    params.require(:lyric).permit :content, :user_id
  end
end
