class Admin::UsersController < ApplicationController 
  load_and_authorize_resource

  def index
    @users = User.all_customer.paginate page: params[:page],
      per_page: Settings.users.order_per_page
  end

  def destroy
    if @user.destroy
      flash[:success] = t "controllers.admin.users.destroy.flash_success"
    else
      flash[:danger] = t "controllers.admin.users.destroy.flash_error"
    end
    redirect_to admin_users_url
  end
end
