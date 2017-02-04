class ArtistsController < ApplicationController 
  load_resource

  def index
    @search = Artist.search params[:q]
    @artists = @search.result
  end

  def show
  end
end
