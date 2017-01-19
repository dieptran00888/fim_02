class UsersController < ApplicationController
  load_and_authorize_resource except: :show
  before_action :find_user, only: :show

  def index
    @search = User.search params[:q]
    @users = @search.result.all_customer.paginate page: params[:page],
      per_page: Settings.users.order_per_page
  end

  def show
    @favorite_songs = @user.list_favorite_songs
      .paginate page: params[:favorite_song_page]
  end

  private
  def find_user
    @user = User.friendly.find_by id: params[:id]
  end
end
