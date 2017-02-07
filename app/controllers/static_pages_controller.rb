class StaticPagesController < ApplicationController
  def show
    if valid_page?
      if params[:page] == "home"
        @albums = Album.all
        @search = Song.ransack params[:q]
        @songs = @search.result
        charts_song
      end
      render template: "static_pages/#{params[:page]}"
    else
      render file: "public/404.html", status: :not_found
    end
  end

  private
  def valid_page?
    File.exist? Pathname.new Rails.root + 
      "app/views/static_pages/#{params[:page]}.html.erb"
  end

  def charts_song
    @songs = Song.order(views: :desc).limit 5
  end
end
