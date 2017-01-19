class UsersController < ApplicationController
  load_and_authorize_resource find_by: :slug

  def index
    @search = User.search params[:q]
    @users = @search.result.all_customer.paginate page: params[:page],
      per_page: Settings.users.order_per_page
  end

  def show
    @favorite_songs = @user.list_favorite_songs
      .paginate page: params[:favorite_song_page]
  end
end
